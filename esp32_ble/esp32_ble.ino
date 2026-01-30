#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <DHT.h>
#include <ArduinoJson.h>
#include <Preferences.h>

namespace Config {
    const int DHT_PIN = 13;
    const int DHT_TYPE = DHT11;
    const int POT_PIN = 35;
    const int RED_PIN = 23;
    const int GREEN_PIN = 22;
    const int BLUE_PIN = 21;
    const int PWM_FREQ = 5000;
    const int PWM_RES = 8;
}

struct DeviceState {
    float temp = 0;
    float hum = 0;
    int brightness = 0;
    int ledMode = 0;  // 0: auto, 1: manual
    int currentR = 0, currentG = 0, currentB = 0;
    int manualR = 255, manualG = 255, manualB = 255;
    int appBrightness = 128;
    int brightMode = 0;  // 0: Pot, 1: App
    bool connected = false;
};

DeviceState g_state;
SemaphoreHandle_t xMutex = NULL;
DHT dht(Config::DHT_PIN, Config::DHT_TYPE);
BLECharacteristic *pTxChar = nullptr;
Preferences prefs;

void sendCurrentState() {
    if (pTxChar == nullptr) return;

    JsonDocument doc;
    bool isConnected = false; 
    if (xSemaphoreTake(xMutex, pdMS_TO_TICKS(100))) {
        doc["temp"] = g_state.temp;
        doc["hum"] = g_state.hum;
        doc["brightness"] = g_state.brightness;
        doc["brightMode"] = g_state.brightMode;
        doc["ledMode"] = g_state.ledMode;
        doc["r"] = g_state.currentR;
        doc["g"] = g_state.currentG;
        doc["b"] = g_state.currentB;
        isConnected = g_state.connected; 
        xSemaphoreGive(xMutex);
    }

    String output;
    serializeJson(doc, output);
    output += "\n";
    if (isConnected) {
        Serial.print("앱으로 데이터 전송: ");
        Serial.println(output);
    }
    pTxChar->setValue(output.c_str());
     if (isConnected) {
        pTxChar->notify();
    }
}

void loadSettings() {
    prefs.begin("mood_lamp", true);

    if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
        g_state.ledMode = prefs.getInt("ledMode", 0); 
        g_state.manualR = prefs.getInt("manualR", 255);
        g_state.manualG = prefs.getInt("manualG", 255);
        g_state.manualB = prefs.getInt("manualB", 255);
        g_state.appBrightness = prefs.getInt("brightness", -1);
        g_state.brightMode = prefs.getInt("brightMode", 0);

        if (g_state.ledMode == 1) { 
            g_state.currentR = g_state.manualR;
            g_state.currentG = g_state.manualG;
            g_state.currentB = g_state.manualB;
        } else { 
            g_state.currentR = 0;
            g_state.currentG = 255;
            g_state.currentB = 0;
        }
        xSemaphoreGive(xMutex);
    }
    prefs.end();
    Serial.println("Settings loaded from NVS");
}

void saveSettings() {
    prefs.begin("mood_lamp", false);

    if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
        prefs.putInt("ledMode", g_state.ledMode);
        prefs.putInt("manualR", g_state.manualR);
        prefs.putInt("manualG", g_state.manualG);
        prefs.putInt("manualB", g_state.manualB);
        prefs.putInt("brightness", g_state.appBrightness);
        prefs.putInt("brightMode", g_state.brightMode);
        xSemaphoreGive(xMutex);
    }
    prefs.end();
}

class MyServerCallbacks : public BLEServerCallbacks {
    void onConnect(BLEServer *pServer) override {
        if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
            g_state.connected = true;
            xSemaphoreGive(xMutex);
        }
        Serial.println("📱 Client Connected");
    }

    void onDisconnect(BLEServer *pServer) override {
        if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
            g_state.connected = false;
            xSemaphoreGive(xMutex);
        }
        BLEDevice::startAdvertising();
        Serial.println("📱 Client Disconnected");
    }
};

class MyRxCallbacks : public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pChar) override {
        String rxValue = pChar->getValue().c_str();
        
        Serial.println("==================================");
        Serial.print("앱으로부터 데이터 수신: ");
        Serial.println(rxValue);
        JsonDocument doc;
        DeserializationError error = deserializeJson(doc, pChar->getValue());
        if (error == DeserializationError::Ok) {
            if (xSemaphoreTake(xMutex, portMAX_DELAY)) {                                
                if (doc.containsKey("ledMode")) g_state.ledMode = (doc["ledMode"] == 1);
                if (doc.containsKey("r")) {
                    g_state.manualR = doc["r"];
                    if (g_state.ledMode == 1)
                        g_state.currentR = g_state.manualR;
                }
                if (doc.containsKey("g")) {
                    g_state.manualG = doc["g"];
                    if (g_state.ledMode == 1)
                        g_state.currentG = g_state.manualG;
                }
                if (doc.containsKey("b")) {
                    g_state.manualB = doc["b"];
                    if (g_state.ledMode == 1)
                        g_state.currentB = g_state.manualB;
                }
                if (doc.containsKey("brightness")) g_state.appBrightness = doc["brightness"];
                if (doc.containsKey("brightMode")) g_state.brightMode = doc["brightMode"];
                xSemaphoreGive(xMutex);
            }
            
            saveSettings();
        } else {
            Serial.print("JSON 파싱 실패: ");
            Serial.println(error.c_str());
        }
    }
};

void TaskControl(void *pvParameters) {
    static unsigned long lastDhtReadTime = 0;
    const unsigned long dhtInterval = 2000;

    for (;;) {
        unsigned long currentMillis = millis();

        if (currentMillis - lastDhtReadTime >= dhtInterval) {
            float t = dht.readTemperature();
            float h = dht.readHumidity();

            if (!isnan(t) && !isnan(h)) {
                if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
                    g_state.temp = t;
                    g_state.hum = h;
                    xSemaphoreGive(xMutex);
                }
                lastDhtReadTime = currentMillis;
            }
        }

        int potVal = analogRead(Config::POT_PIN);
        int currentBright = map(potVal, 0, 4095, 255, 0);

        if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
            if (g_state.brightMode == 1) currentBright = g_state.appBrightness;
            g_state.brightness = currentBright;

            if (g_state.connected) {
                
                if (g_state.ledMode == 0) { // Auto
                    if (g_state.temp < 18) {
                        g_state.currentR = 0;
                        g_state.currentG = 0;
                        g_state.currentB = currentBright;
                    } else if (g_state.temp < 28) {
                        g_state.currentR = 0;
                        g_state.currentG = currentBright;
                        g_state.currentB = 0;
                    } else {
                        g_state.currentR = currentBright;
                        g_state.currentG = 0;
                        g_state.currentB = 0;
                    }
                } else {
                    g_state.currentR = map(g_state.manualR, 0, 255, 0, currentBright);
                    g_state.currentG = map(g_state.manualG, 0, 255, 0, currentBright);
                    g_state.currentB = map(g_state.manualB, 0, 255, 0, currentBright);
                }
                ledcWrite(Config::RED_PIN, g_state.currentR);
                ledcWrite(Config::GREEN_PIN, g_state.currentG);
                ledcWrite(Config::BLUE_PIN, g_state.currentB);
            } else {
                ledcWrite(Config::RED_PIN, 0);
                ledcWrite(Config::GREEN_PIN, 0);
                ledcWrite(Config::BLUE_PIN, 0);
                g_state.currentR = 0;
                g_state.currentG = 0;
                g_state.currentB = 0;
            }
            xSemaphoreGive(xMutex);
        }
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}

void TaskTelemetry(void *pvParameters) {
    for (;;) {
        DeviceState local_state_copy;
        bool is_connected = false;

        if (xSemaphoreTake(xMutex, pdMS_TO_TICKS(100))) {
            local_state_copy = g_state;
            is_connected = g_state.connected;
            xSemaphoreGive(xMutex);
        } else {
            Serial.println("ERROR: Telemetry Task could not get mutex!");
            vTaskDelay(pdMS_TO_TICKS(2000));
            continue;
        }
        if (is_connected) {
            sendCurrentState();
        }
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}

void setup() {
    Serial.begin(115200);
    xMutex = xSemaphoreCreateMutex();
    loadSettings();
    dht.begin();

    ledcAttach(Config::RED_PIN, Config::PWM_FREQ, Config::PWM_RES);
    ledcAttach(Config::GREEN_PIN, Config::PWM_FREQ, Config::PWM_RES);
    ledcAttach(Config::BLUE_PIN, Config::PWM_FREQ, Config::PWM_RES);

    BLEDevice::init("ESP32_Smart_Lamp");
    BLEServer *pServer = BLEDevice::createServer();
    pServer->setCallbacks(new MyServerCallbacks());
    BLEService *pService = pServer->createService("4fafc201-1fb5-459e-8fcc-c5c9c331914b");

    pTxChar = pService->createCharacteristic("cba1d466-344c-4be3-ab3f-189f80dd7518",
                                             BLECharacteristic::PROPERTY_NOTIFY |
                                             BLECharacteristic::PROPERTY_READ);
    pTxChar->addDescriptor(new BLE2902());

    BLECharacteristic *pRxChar = pService->createCharacteristic(
            "beb5483e-36e1-4688-b7f5-ea07361b26a8", BLECharacteristic::PROPERTY_WRITE);
    pRxChar->setCallbacks(new MyRxCallbacks());

    pService->start();
    pServer->getAdvertising()->start();

    sendCurrentState(); 

    xTaskCreate(TaskControl, "Control", 4096, NULL, 2, NULL);
    xTaskCreate(TaskTelemetry, "Telemetry", 4096, NULL, 1, NULL);
}

void loop() {
    vTaskDelay(portMAX_DELAY);
}