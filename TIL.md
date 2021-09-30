# TIL(Today I Learn)



#### 2021-09-28

> iOS UI & Entry Point

- Label, Button, ImageView 및 View Controller 실습
- Entry Point의 이해
  - Entry Point : 화면의 첫 시작 부분
  - Entry Point가 없을 시 디버그 영역에 Entry Point를 지정하라는 메시지가 나오며,  앱이 실행되지 않는다.
  - Entry Point를 다른 곳으로 지정 가능하다.

###### 실습 파일 - SSACMOVIE







#### 2021-09-29

> iOS 버전 & Code 작성

- iOS 12 version과 13 version의 차이 이해
- 12.0 코드 작성 시 13.0 이후의 버전 대응 코드 작성
  - @available(iOS 13.0, *)
  - var window : UIWindow?
- Cocoa Touch Class 를 이용한 View Controller 코드 작성
  - Label
    - clipsToBound : 테두리 부분의 코드 적용시 필요
    - Label.text
  - Button
    - Button.layer.cornerRadius 같은 테두리 부분 코드 바로 적용 가능
    - Button.setTitle

###### 실습 파일 - BAMIN







#### 2021-09-30

> Swift 기본 문법 & Code 작성

- 문법

  - optional 타입
  - null을 nil이라고 한다.
  - 배열 표기
  - Dictionary 사용법

- Text Field 작성

  - 여러 항목을 선택하고 Embed in View를 선택할 수 있다. (하단 다운로드 모양)

  - StackView를 이용한 정렬
    - hide 시 공간을 나머지 object들끼리 나눠 갖는다.
    - 일반적인 hide 시에는 공간이 그대로 남고, 그 object만 숨겨진다.

  - Constraints 위치 설정 (하단 네모 두개 모양)
  - Constraints 크기 설정 (하단 네모 하나 모양)
  - Tap Gesture Recognizer를 등록하여 Tap 시 키보드가 내려가게 한다.
    - SignUpViewController를 cocoa touch 파일로 만든다.
    - Tap Gesture Recognizer를 끌어와 함수 등록한다.
    - view.endEditing(true)

###### 실습 파일 - MyPlayground, BAMIN