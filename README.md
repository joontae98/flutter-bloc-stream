# Flutter Bloc Stream App

**Bloc Pattern**, **Stream**의 이해를 돕기 위한 **App**

### BLoC(Bussiness Logic Component)

**BLoC**은 비즈니스 로직을 네트워크나 저장소에서 분리하고 UI 화면 사이에서 이벤트 및 데이터를 수신하고 전달하는 비즈니스 로직 패턴이다.
UI는 UI를 나타내는 코드만 있어야 하고 유효성 검사, 데이터 조작과 같은 어떤 논리적인 처리는 **BLOC**에서 처리되어야 한다는 것을 뜻한다.
각각의 역할을 나누어 맡은 역할만 할 수 있게 만드는 아키텍처 설계 패턴이다.   

**BLoC**은 추가로 **Reactive Programming**을 기본 기술로 사용하여 이벤트와 데이터 흐름을 처리한다. **Reactive Programming**은 데이터 스트림을 비동기적으로 처리해야 하는 문제를 해결하는 방법이다.   

**Flutter** 에서 **BLoC** 은 각 **UI** 객체들이 **Sink** 를 이용해서 값을 전달하고 **Stream** 을 통해 상태를 구독한다. 구독하고 있는 **BLoC** 객체 상태가 변경되면 **BLoC** 객체를 구독 중인 UI 객체들도 즉시 변경된다.   

출처: https://centbin-dev.tistory.com/34

## Tech used
#### Built with
* async
* material
#### Package

 * english_words


출처: https://www.youtube.com/channel/UCUH2DSbsNUz2sW3kBNn4ibw
