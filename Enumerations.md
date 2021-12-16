열거형(Enumerations)
===
_관련된 값의 그룹을 위한 일반 타입을 정의하고 type-safe 방법으로 값을 동작하는 자료형_
- `String` `Int` `Double` `Character`자료형이 열거형의 케이스로 제공될 수 있습니다.
- 하나의 열거형의 일부로 관련된 케이스의 공통 세트를 정의할수 있습니다.
## 열거형 Syntax
`enum`키워드와 중괄호`{}`안에 모든 정의를 위치시켜 나타냅니다.
```swift
enum SomeEnumeration{
    //열거형 정의 기재
}
```
열거형 내부에서 `case`키워드를 통해 정의된 값을 _열거형 케이스_라고 부릅니다. 
```swift
    enum Planet {
        case mercury
        case venus
    }
//한줄로 표기 가능
    enum Planet{
        case mercury,venus,earth,mars,jupiter
    }
```
각 열거형 케이스는 새로운 자료형으로 정의합니다.
```swift
var nextPlanet = Planet.mercury
//점 구문을 사용한 케이스 변경
nextPlanet = .venus
```
### Switch 구문에서 열거형 Value Matching
```swift
nextPlanet = .mercury
switch nextPlanet{
case .mercury:
    print("다음행성은 금성입니다")
case .venus:
    print("다음행성은 지구입니다")
case .earth:
    print("다음행성은 화성입니다.")
case .mars:
    print("다음행성은 목성입니다.")
case .jupiter:
    print("다음행성은 토성입니다.")
}
```
>switch문을 사용할경우 열거형 데이터의 모든 `case`를 고려해야합니다.
>생략된 case가 있을경우 코드가 컴파일되지 않습니다.
> 명시적으로 해결되지 않는 case의 경우를 `default`케이스에 제공할 수 있습니다.

### 열거형의 Case반복
열거형의 이름뒤에 `: CaseIterable`키워드를 작성하여 케이스를 반복호출할 수 있습니다.  
`allCases`프로퍼티로 모든 케이스를 수집/방출할 수 있습니다.
```swift
enum Beverage: CaseIterable {
    case coffee,tea,juice
}
//allCases프로퍼티 = 열거형 인스턴스
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) available")
//allCases를 응용한 for-in구문
for beverage in Beverage.allCases{
    print(beverage)
}
```
## Associated Values(연관 값)
열거형 케이스에서 Case Value화 함께 저장될 수 있는 다른 자료형 값
```swift
enum enumeration{
    case case1(Int,Int) // case와 함께 정의
    case case2(String)
}
var enum1 = enumeration.case1(0,0) //연관값과 함께 초기화
var enum2 = enumeration.case2("Associated")
var enum1 = enumeration.case2("Associated") // 다른 케이스로 할당 가능
```
switch 구문을 활용한 열거형 연관 값 호출
```swift
switch enum1 {
    case .case1(let num1,let num2):
        print("case1 :\(num1), \(num2)")
    case let .case2(str1): //case 자체를 변수처리하여 모든 연관값 선언
        print("case2 :\(str1)")
}
```
## Raw Value(원시값)
열거형 데이터의 최초 선언시 모든 케이스에 하나의 자료형으로 초기화 되는 값  
`rawValue`프로퍼티를 통해 호출 할 수 있습니다.  
예시
```swift
enum ASCIIControlCharacter : Character { //모든 Case의 원시값 = Char
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```
### 임시적으로 할당된 Raw Value
열거형 데이터 선언시 Raw Value를 반드시 선언할 필요는 없습니다. 명시적으로 선언하지 않을 경우 swift에서 자동으로 할당해 줍니다.  
+ Int: 0부터시작하여 1씩 증가하는 값 할당
+ String : Case명 할당
### Raw Value으로 초기화
열거형 데이터를 Raw Value로 정의하면 RawValue로 초기화를 진행합니다.  
원시값 초기화는 항상 옵셔널 열거형 케이스를 반환합니다.
```swift
let possiblePlanet = Planet(rawValue : 7)
```
> 원시값 케이스 초기화는 실패 가능성이 존재합니다.
## 재귀 열거형(Recursive Enumerations)
하나 이상의 연관 값이 열거형의 다른 인스턴스를 포함하는 열거형.  
케이스가 재귀적임을 나타내기위해 `indirect`키워드를 케이스 앞에 기재합니다.  
_예시_
```swift
enum ArithmeticExpression{
    case Number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression,ArithmeticExpression)
}
```
_열거형에 `indirect` 키워드를 사용해서 이하 모든 연관값에 간접을 활성화 시킬 수 있습니다._
```swift
indirect enum ArithmeticExpression {
    case Number(Int)
    case addition(ArithmeticExpression,ArithmeticExpression)
}
```
