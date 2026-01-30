# 💡 ESP32 LED Lamp Controller

**클린 아키텍처**와 **Riverpod**을 기반으로 설계된 LED 제어 애플리케이션입니다. ESP32 와 BLE(Bluetooth Low Energy)로
통신하며 실시간 센서 데이터 모니터링 및 LED 제어 기능을 제공합니다.

## 주요 기능

- **BLE 장치 관리**: 주변 ESP32 기기 검색, 연결 및 비정상 연결 종료 감지
- **실시간 데이터 모니터링**:
  - 온도, 습도, 밝기 센서 값을 2초 주기로 수신 및 시각화
  - 데이터 변화를 보여주는 실시간 로그 시스템
- **스마트 LED 제어**:
  - **자동 모드**: 실내 온도에 따라 LED 색상 자동 변경
  - **수동 모드**: 사용자 지정 색상 프리셋 적용 및 앱/가변저항 밝기 조절

## 하드웨어 설정

- **ESP32 WROOM-32E 개발 보드**
- DHT11 (온도/습도 센서)
- 가변 저항 모듈 (3핀: VCC, GND, OUT)
- RGB LED 모듈 (4핀: R, G, B, GND)

| Component                | ESP32 Pin | Note                        |
| :----------------------- | :-------- | :-------------------------- |
| **DHT11 온/습도 센서**   | GPIO 13   | 온도 및 습도 측정           |
| **가변 저항 모듈**       | GPIO 35   | 가변저항을 이용한 밝기 조절 |
| **RGB LED 모듈 (Red)**   | GPIO 23   | PWM 제어                    |
| **RGB LED 모듈 (Green)** | GPIO 22   | PWM 제어                    |
| **RGB LED 모듈 (Blue)**  | GPIO 21   | PWM 제어                    |

## 아키텍처 구조

```
lib/features/ble/
├── data/            # 세부 구현 (Models, Repositories Impl, DataSources)
├── domain/          # 순수 비즈니스 로직 (Entities, UseCases, Repository Interfaces)
└── presentation/    # UI 및 상태 관리 (Screens, Widgets, Providers, Controllers)
```
