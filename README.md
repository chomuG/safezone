# SafeZone

비콘 기반 안전 구역 모니터링 앱

## 프로젝트 소개

SafeZone은 비콘 기술을 활용한 실시간 위치 추적 및 안전 구역 모니터링 시스템입니다. Firebase를 백엔드로 사용하여 사용자의 위치 정보를 실시간으로 관리하고, 로컬 알림을 통해 안전 상태를 알려주는 종합적인 안전 관리 애플리케이션입니다.

## 주요 기능

### 비콘 기반 위치 추적
- 실시간 비콘 신호 감지
- 정확한 실내 위치 파악
- 자동 출입 감지

### 안전 구역 관리
- 안전 구역 설정 및 관리
- 구역 출입 자동 감지
- 실시간 상태 업데이트

### 사용자 인증
- Firebase Authentication 기반 로그인
- 안전한 사용자 관리
- 개인별 설정 저장

### 알림 시스템
- 로컬 푸시 알림
- 안전 구역 출입 알림
- 상태 변화 실시간 알림

## 기술 스택

- **프레임워크**: Flutter 2.x
- **언어**: Dart 2.0+
- **상태관리**: BLoC Pattern (RxDart 0.20.0)
- **백엔드**: Firebase
  - Firebase Authentication 0.8.4+2
  - Cloud Firestore 0.9.13+1
- **비콘**: Custom beacons library (GitHub)
- **기타**:
  - 로컬 저장소 (shared_preferences 0.4.3)
  - 로컬 알림 (flutter_local_notifications 0.6.0)
  - 국제화 (intl 0.15.7)

## 아키텍처

### BLoC 패턴 구조
```
lib/
├── main.dart                  # 앱 진입점
├── app.dart                   # 앱 설정
├── constants.dart             # 상수 정의
├── blocs/                     # BLoC 계층
│   ├── login/                # 로그인 BLoC
│   │   ├── login_bloc.dart   # 로그인 로직
│   │   ├── login_provider.dart # 로그인 프로바이더
│   │   └── login_validators.dart # 입력 검증
│   └── parent/               # 부모 BLoC
├── models/                    # 데이터 모델
└── screens/                   # UI 화면
```

### 핵심 기능 모듈
- **Login BLoC**: 사용자 인증 및 로그인 상태 관리
- **Parent BLoC**: 부모/관리자 기능 관리
- **Beacon Module**: 비콘 신호 처리 및 위치 추적
- **Notification Service**: 로컬 알림 처리

## 주요 특징

### 실시간 모니터링
- 비콘 기반 정확한 실내 위치 추적
- Firebase를 통한 실시간 데이터 동기화
- 즉시 상태 업데이트 및 알림

### 사용자 중심 설계
- 직관적인 사용자 인터페이스
- 개인화된 안전 구역 설정
- 간편한 로그인 및 설정 관리

### 안전성
- Firebase Authentication을 통한 보안
- 개인정보 보호를 위한 데이터 암호화
- 로컬 저장소를 활용한 오프라인 지원

## 설치 및 실행

### 사전 요구사항
- Flutter 2.x 이상
- Dart 2.0 이상
- Firebase 프로젝트 설정
- Android/iOS 개발 환경

### 설치 방법
```bash
# 의존성 설치
flutter pub get

# 앱 실행
flutter run
```

### Firebase 설정
1. Firebase 콘솔에서 프로젝트 생성
2. Android/iOS 앱 등록
3. google-services.json (Android) / GoogleService-Info.plist (iOS) 추가
4. Authentication 및 Firestore 활성화

### 권한 설정
- **위치 권한**: 비콘 스캔을 위한 위치 접근
- **블루투스 권한**: 비콘 신호 감지
- **알림 권한**: 로컬 푸시 알림

## 사용 시나리오

### 학교 안전 관리
- 학생들의 교실 출입 관리
- 안전 구역 이탈 시 즉시 알림
- 실시간 위치 현황 파악

### 사무실 출입 관리
- 직원 출퇴근 자동 기록
- 특정 구역 접근 관리
- 보안 구역 모니터링

### 가정 내 안전 관리
- 아이들의 안전 구역 관리
- 위험 지역 접근 알림
- 실시간 위치 확인

## 개발 환경

- **Flutter SDK**: 2.x
- **IDE**: Android Studio / VS Code
- **아키텍처**: BLoC Pattern
- **백엔드**: Firebase
- **비콘**: Custom Beacons Library

## 향후 개선 계획

### 기능 확장
- 다중 비콘 지원
- 지오펜싱 기능 추가
- 웹 관리자 페이지

### 성능 최적화
- 배터리 사용량 최적화
- 비콘 스캔 효율성 개선
- 네트워크 사용량 최적화

## 버전 정보

현재 버전: 1.0.0+1