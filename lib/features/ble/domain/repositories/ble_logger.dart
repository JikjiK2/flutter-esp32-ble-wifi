abstract class BleLogger {
  /// 통신 관련 로그 (TX/RX Raw 데이터, 저수준 에러 등)
  void logComm(String message);
  
  /// 비즈니스 데이터 로그 (파싱된 상태 값, 센서 변화 등)
  void logData(String message);
}
