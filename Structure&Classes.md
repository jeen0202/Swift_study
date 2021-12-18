구조체와 클래스(Structures & Classes)
===
_Structure & Class_ 는 유연한 구조의 Code 구성요소입니다.  
Swift는 사용자정의 Structure와 Class에 대해 별도의 파일을 만들 필요가 없습니다.
단일 파일에 Structure와 Class를 정의면 자동으로 다른 코드에서 사용할 수 있습니다.
## 구조체와 클래스의 비교
### 공통점
+ Value저장을 위한 `Property`정의
+ 기능 제공을 위한 `Method`정의
+ Value에 대한 접근을 제공하는 `Sub Script`정의
+ 초기화 상태 설정을 위한 `초기화`정의
+ 기능정 확장을 위한 `extend`
+ 표준 기능 제공을 위한 `Protocol`준수
### Class의 추가적인 기능
+ 다른 Class의 특성 `상속가능`
+ 인스턴스의 type을 확인하고 해석할 수 있는 `Type Casting`가능
+ 인스턴스가 할당된 리소스 해제를 위한 초기화 해체(``)
+ 참조 카운팅은 하나 이상의 클래스 인스턴스 참조를 허락

## Class & Structure 정의
구조체는 `struct` 클래스는 `class`키워드로 시작하여, 중괄호 안에 전체 정의가 위치합니다.
```swift
struct SomeStructure {
    //전체 정의    
}
class SomeClass {
    //전체 정의
}
```
> Struct/Class를 새로 정의할 떄는 표준 Swift타입과 동일한`UpperCamelCase`를 적용하며, 내부의 프로퍼티나 메서드는 구분을 위해 `lowerCamelCase`를 적용합니다.
## Struct와 Class의 인스턴스
정의된 구조체의 사용을 위해서는 인스턴스가 필요합니다.
초기화 구문을 통해 Struct/Class의 새로운 인스턴스를 생성할 수 있습니다.
```swift
//모든 프로퍼티가 기본값으로 초기화 되는 인스턴스 생성
let someS = someStructure()
let someC = someClass()
```
### 프로퍼티 접근
_점 구문_ 을 사용하여 인스턴스의 프로퍼티에 접근할 수 있습니다.
<small>점 구문은 인스턴스이름 뒤에 `.`구분자로 분리하고 공백없이 프로퍼티 이름을 작성합니다.
```swift
someS.someProperty = 30
someC.someProperty = "test"
```

### Structure 자료형에 대한 멤버별 초기화 구문
모든 구조체는 새로운 인스턴스의 멤버 프로퍼티를 초기화 할때 사용할 수 있는 _멤버별 초기화 구문_ 을 가지고 있습니다.
```swift
Struct Resolution = {
    var width = 0
    var height = 0
}
let vga = Resolution(width : 640, height : 480)
```
> Structure와 반대로 Class는 멤버별 초기화를 사용하지 않습니다.

## 초기화
<small>_초기화_ 는 인스턴스의 클래스,구조체,열거형을 사용하지 위해 준비하는 단계이며 _초기화 구문_ 을 정의하여 구현합니다.

이때 인스턴스에 멤버 프로퍼티의 초기값을 설정하고 새로운 인스턴스가 사용할 준비가 되기 전에 다른 설정이나 초기화를 수행하는것을 포함합니다.  

Class 인스턴스는 인스턴스가 할당 해제되기 전에 정리를 수행하는 _초기화 해제_ 를 구현 할 수 있습니다.</small>

### 저장된 프로퍼티에 초기값 설정
Class와 Struct는 인스턴스가 생성될 떄 까지 모든 저장된 프로퍼티에 적절한 초기값이 반드시 설정되어있어야 합니다.

#### 초기화 구문
<small>_초기화 구문_ 은 새로운 인스턴스를 생성하기위해 호출됩니다.  
`init`키워드를 사용하여 파라미터가 없는 인스턴스 메서드와 같은 형식으로 사용할 수 있습니다.</small>
```swift
init(){
    초기화 실행
}
//예시
struct Fahrenheit{
    var temp : Double
    init(){
        temp = 32.0
    }
}
var f = Fahrenheit()
f.temp // init으로 초기화된 32.0
```

#### 기본 프로퍼티 값
프로퍼티가 항상 같은 초기값을 가지는 경우 초기화 구문이 아닌 선언에 가까운 방식으로 프로퍼티의 초기화를 수행할 수 있습니다.
```swift
struct Fahrenheit{
    var temp = 32.0
}
```
### 사용자 초기화 구문
초기화 중에 상수 프로퍼티 할당으로 초기화 단계를 사용자화 할 수 있습니다.
#### 초기화 파라미터
초히화의 정의의 부분으로 초기화 단계를 사용자화 하는 값의 타입과 이름을 정의하기 위해 제공할 수 있습니다.
```swift
//예시
struct Celsius{
    var tempInCelsius : Double
    //초기화 파라미러를 사용한 두가지 초기화 구문
    init(fromFahrenheit fahrenheit: Double){
        tempInCelsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin : Double){
        tempInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit : 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
```
첫번째 초기화 구문은 인자 라벨`fromFahrenheit`와 파라미터 명 `fahrenheit`을 가지는 초기화 파라미터가 사용되었고, 두번째 초기화 구문은 인자라벨 `fromKelvin`과 파라미터명 `kelvin`을 가진 초기화 파라미터가 사용되었습니다.
#### 파라미터 명과 인자 라벨
초기화 파라미터는 초기화 구문 호출을 위한 `인자 라벨` 초기화 구문 바디내에서 사용되는 `파라미터 명`을 가질 수 있으나, 식별 함수 이름을 가질 수는 없습니다.
따라서 초기화 구문의 식별을 위해 `인자 라벨`과 `파라미터 명`의 사용이 중요합니다.

특히 Swift에서는 사용자가 제공하지 않아도 초기화 구문에서 모든 파라미터에 대한 `인자 라벨`을 자동으로 제공하며 인자 라벨을 사용하지 않고 초기화 구문을 호출 할 수 없습니다.
```swift
//예시
struct Color {
    let red,green,blue: Double
    init(red:Double,green:Double,blue:Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double){
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red:1.0, green:0.0, blue:1.0)
let halfGray = Color(white:0.5)
let veryGreen = Color(0.0, 1.0, 0.0)//인자 라벨을 사용하지 않아 에러 발생
```

초기화 구문 파라미터에 인자 라벨 사용을 원지 않을 경우 명시적으로 인자 라벨 대신 `_` 을 작성하여 재정의해야 합니다.
```swift
struct Celsius{
    var tempInCelsius : Double
    init(_ celsius:Double){
        tempInCelsius = celsius
    }
}
let bodyTemp = Celsius(37.0)//인자 라벨 없이 초기화
```
#### Optional 프로퍼티 타입
Optional 타입으로 프로퍼티를 선언 할 수 있으며 명시적으로 초기화 하지 않을 경우 기본적으로 `nil` 값으로 초기화 됩니다.
```swift
class SurveyQuestion{
    var test : String
    var response : String?
    init(text:String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}
let cheeseQ = SurveyQuestion(text:"Do you like Chesse?")
chesseQ.response //nil값
cheeseQ.ask()
chesseQ.response = "Yes" //
```
#### 초기화 프로퍼티 상수 할당
초기화 진행시에는 상수로 할당된 프로퍼티에 Value를 한번 할당 할 수 있습니다.
> Class 인스턴스의 경우 상수 프로퍼티를 상속받은 하위 클래스에서는 프로퍼티를 수정할 수 없습니다.
