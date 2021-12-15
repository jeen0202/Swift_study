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