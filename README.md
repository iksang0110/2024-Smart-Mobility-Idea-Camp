# 전기차 기반 이동형 혈액투석 시스템 앱

## Mobile Dialysis App

**Mobile Dialysis App**은 전기차 기반 이동형 혈액투석 시스템을 위한 종합 관리 앱입니다. 이 앱은 환자 관리, 의료진 지원, 차량 운영 관리 등을 통해 이동형 혈액투석 서비스를 효율적으로 운영할 수 있도록 설계되었습니다. 전기차 기반의 이동형 시스템은 환경 친화적인 접근을 제공하며, 환자들이 정기적인 투석 치료를 보다 편리하게 받을 수 있도록 지원합니다.

## 주요 기능

<img src="https://github.com/user-attachments/assets/dc906e2a-90f2-4ab3-9082-8ee053799164" alt="KakaoTalk_Photo_1" width="200"/>
<img src="https://github.com/user-attachments/assets/41e4d920-16e6-4961-92a7-8c6d76336a2a" alt="KakaoTalk_Photo_2" width="200"/>
<img src="https://github.com/user-attachments/assets/30fd452d-de89-4a20-9761-44d15e1fc7c2" alt="KakaoTalk_Photo_3" width="200"/>
<img src="https://github.com/user-attachments/assets/c0238730-06fb-4c17-b0de-bd4fff9e4486" alt="KakaoTalk_Photo_4" width="200"/>
<img src="https://github.com/user-attachments/assets/7b4e0423-7456-40f5-b931-87c94426a607" alt="KakaoTalk_Photo_5" width="200"/>
<img src="https://github.com/user-attachments/assets/272499b9-7942-457d-83a7-a2a3d34d7a8f" alt="KakaoTalk_Photo_6" width="200"/>
<img src="https://github.com/user-attachments/assets/d5b3bf5c-0bd8-45f9-b8f8-fa4ec66e7613" alt="KakaoTalk_Photo_7" width="200"/>





### 환자 관리 기능

* **예약 및 일정 관리**: 환자가 투석 일정을 예약하고 확인할 수 있습니다.
* **건강 데이터 모니터링**: 환자가 자신의 혈압, 체중, 혈당 등의 생체 데이터를 입력하고 모니터링할 수 있습니다.
* **알림 및 리마인더**: 투석 일정, 차량 도착 예정 시간, 약물 복용 알림 등을 제공합니다.
* **의료진과의 소통**: 환자가 의료진에게 질문하거나 상담 요청을 할 수 있는 기능을 포함합니다.

### 의료진 지원 기능

* **환자 프로필 및 기록 관리**: 환자의 건강 정보를 조회하고, 투석 기록을 관리합니다.
* **실시간 모니터링**: 투석 중인 환자의 생체 신호를 실시간으로 모니터링하고, 이상이 발견되면 알림을 제공합니다.
* **진단 지원 도구**: AI 기반 진단 지원 도구를 통해 의료진이 환자의 데이터를 분석하고 진단을 지원합니다.
* **응급 상황 관리**: 응급 상황 발생 시 인근 병원에 알림을 보내고, 긴급 대응 프로토콜을 실행할 수 있습니다.

### 차량 운영 관리자 기능

* **차량 위치 및 상태 추적**: 차량의 실시간 위치와 배터리 상태, 연료 수준 등을 모니터링합니다.
* **일정 및 경로 관리**: 차량의 이동 경로를 최적화하고 투석 스케줄에 따라 환자 위치에 대한 효율적인 경로를 설정합니다.
* **정비 알림 시스템**: 차량 상태와 정비 필요 사항에 대한 알림을 관리자에게 전송합니다.

## 기술 스택

- Flutter SDK (버전 3.0.0 이상)
- Dart 프로그래밍 언어
- 상태 관리: Provider
- 차트 라이브러리: fl_chart
- 날짜 및 시간 처리: intl 패키지

## 시작하기

### 사전 요구사항

- Flutter SDK 설치
- Android Studio 또는 VS Code 설치
- iOS 개발을 위한 Xcode (Mac 사용자의 경우)

### 설치

1. 이 저장소를 클론합니다:
   ```
   git clone https://github.com/yourusername/my_dialysis_app.git
   ```

2. 프로젝트 디렉토리로 이동합니다:
   ```
   cd my_dialysis_app
   ```

3. 필요한 패키지를 설치합니다:
   ```
   flutter pub get
   ```

4. 앱을 실행합니다:
   ```
   flutter run
   ```

## 프로젝트 구조

```
my_dialysis_app/
│
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── appointment_model.dart
│   │   ├── health_data_model.dart
│   │   └── vehicle_location_model.dart
│   └── views/
│       ├── user_type_selection_screen.dart
│       ├── patient/
│       │   ├── home_screen.dart
│       │   ├── appointment_screen.dart
│       │   ├── health_data_screen.dart
│       │   └── vehicle_tracking_screen.dart
│       ├── medical_staff/
│       │   └── home_screen.dart
│       └── vehicle_manager/
│           └── home_screen.dart
├── pubspec.yaml
└── README.md
```

## 기여하기

프로젝트에 기여하고 싶으시다면 다음 절차를 따라주세요:

1. 이 저장소를 포크합니다.
2. 새 브랜치를 생성합니다 (`git checkout -b feature/AmazingFeature`).
3. 변경사항을 커밋합니다 (`git commit -m 'Add some AmazingFeature'`).
4. 브랜치에 푸시합니다 (`git push origin feature/AmazingFeature`).
5. Pull Request를 생성합니다.
