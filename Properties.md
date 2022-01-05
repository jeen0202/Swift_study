Properties
===
***Properties(프로퍼티)*** 는 Value와 Class,Struct,Enumerate와 연결합니다.

**Stored Property**와 **Computed Properties**로 구분되며 대게 인스턴스와 연결되는 경우가 잦습니다.

Property Observer를 정의하여 Property의 값의 변경에 대한 모니터링을 하고 사용자 지정 동작에 응답할 수 있습니다.

Property Wrapper를 사용하여 여러 Property의 Getter와 Setter에서 코드 재사용이 가능합니다.

## Stored Propeties(저장된 프로퍼티)
```Stored Property```의 가장 간단한 형식은 특정 Class나 Struct의 인스턴스의 일부분으로 지정된 상수/변수 입니다.

Stored Property에 대한 기본값을 제공할 수 있으며, 초기화 중에 초기값을 설정/수정할 수 있습니다. 

### Lazy Stored Peoperties(지연 저장된 프로퍼티)
처음 사용될때까지 초기값이 계산되지 않는 프로퍼티를 의미하며, 선언전에 ```lazy``` 수정자를 붙여 나타냅니다.
> 인스턴스 초기화 완료 이후에도 초기값인 없을 경우를 대비하여 ```var```키워드를 가진 변수로 선업해야 합니다.

Lazy Properties는 프로퍼티의 초기값으로 필요할 떄까지 수행되면 안되는 복잡하거나 비용이 많이 드는 계산에 유용하게 사용됩니다.

### Stored Property와 인스턴스 변수
Property 외에도 Property에 저장된 값을 백업 저장소로 인스턴스 변수를 사요할 수 있습니다.

## Computed Properties(계산된 프로퍼티)
Class,Struct,Enum은 값을 실질적으로 저장하지 않는 ```Computed Properties```를 정의할 수 있습니다. 이때 다른 프로퍼티와 값을 간접적으로 조회하고 설정하기 위한 Getter, optional Setter를 제공합니다.

### 짧은 Getter, Setter 선언
+ Computed Property가 새로운 setter를 이름없이 정의하면 ```newValue``라는 기본 이름이 사용됩니다.
+ Computed Property의 getter가 단일 표현식일경우 암시적인 표현식을 반화합니다.

### Read-only Computed Properties
setter가 없고 getter만 있는 Computed Property를 ```read-only computed property```라고 합니다. read-only computed propety는  항상 값을 반환하고 점 구문으로 접근이 가능하지만 다른 값을 설정 할 수는 없습니다.

## Property Observer(프로퍼티 관찰자)
**Property Observer** 는 프로퍼티의 값이 변경되는지 관찰하고 응답합니다. 프로퍼티의 현재값이 새로운 값과 같더라도 프로퍼티의 값이 설정될 때 호출됩니다.

+ 상속된 프로퍼티에서 하위 클래스의 프로퍼티를 재정의하여 프로퍼티 관찰자를 추가합니다.
+ 정의한 Computed Property의 경우 Observer를 생성하는 대신 Setter를 이용하여 값 변경을 관찰하고 응답합니다.

**Property Observer 정의 방법**
+ ```willset``` : 값이 저장되기 직전에 호출
+ ```didset``` : 새로운 값이 저장된 직후에 호출

```willset``` Observer를 구현하면 상수 파라미터로 새로운 Property값이 전달됩니다. 구현의 일부로 이 파라미터에 이름을 지정할 수 있습니다. 미지정시 기본 파라미터명 ```newValue```로 만들어 질 수 있습니다.

```didset``` Observer를 구현하면 이전 프로퍼티값을 포함한 상수 파라미터가 전달됩니다. 이름을 지정하거나 기본 파라미터명 `oldValue`로 사용 될 수 있습니다. `didset` Observer내의 프로퍼티에 값을 할당하면 새로운 값으로 방금 설정한 값을 대체합니다.

> 상위 클래스 Property의 `didset`과 `willset` Observer는 상위 클래스 초기화 호출 이후 하위 클래스 초기화에서 프로퍼티가 설정될 떄 호출 됩니다. 상위 클래스의 초기화 전 자체 프로퍼티 설정 중에는 호출 되지 않습니다.

## Property Wrappers(프로퍼티 래퍼)
**Property Wrapper**는 프로퍼티가 저장되는 방법을 관리하는 코드와 프로퍼티를 정의하는 코드 사이에 분리 계층을 추가합니다. 프로퍼티 래퍼를 사용하여 관리 코드를 한번에 작성하여 여러 프로퍼티에 적용하는 방식을 사용 할 수 있습니다.

Property Wrapper 정의를 위해 `wrappedValue` 프로퍼티를 정의한 class/struct/enum 을 생성합니다.
```swift
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue : Int {
        get {return number}
        set {number = min(newValue,12)}
    }
}

struct SmallRect{
    @TwelveOrLess var height : Int
    @TwelveOrLess var width: Int
}
```
Property Wrapper를 적용할 때 컴파일러는 이를 위한 저장소를 제공하는 코드와 Wrapper를 통해 프로퍼티에 접근하는 코드를 합성합니다.

특수 속성구문을 사용하지 않고 명시적으로 구조체에 프로퍼티를 패밍하는 코드를 작성할 수도 있습니다.

### Wrapped Properties를 위한 초기값 설정
`init()` 메서드로 초기값을 추가해 래핑된 프로퍼티에 대한 초기값을 설정할 수 있습니다.

Property Wrapper 인자를 포함하면 할당을 사용하여 초기값을 지정할 수 있습니다.
```swift
// 3개의 초기화를 포함한 Property Wrapper
@propertyWrapper
struct SmallNumber {
    private var maximum : Int
    private var number : Int
    
    var wrappedValue : Int {
        get { return number}
        set {number = min(newValue,maximum)}
    }
    init () {
        maximum = 12
        number = 0
    }
    init (wrappedValue: Int){
        maximum = 12
        number = min(wrappedValue,maximum)
    }
    init(WrappedValue : Int, maximum : Int){
        self.maximum = maximum
        number = min(WrappedValue,maximum)
    }
}
```
### Property Wrapper에서 Value Projecting
**Property Wrapper**는 `WrappedValue`이외에 `Projected Value`(투영된 값)정의에 의해 추가적인 기능을 노출 할 수있습니다.
`Projected Value`는 서두에 `$`표시를 눟여 사용됩니다.
```swift
// Value Project
@propertyWrapper
struct TinyNumber {
    private var number : Int
    private(set) var projectedValue : Bool    
    var wrappedValue : Int {
        get { return number }
        set {if newValue > 12 {
                number = 12
                projectedValue = true
            }else{
                number = newValue
                projectedValue = false
            }       }     }
    init(){
        self.number = 0
        self.projectedValue = false
    }}

struct SomeStruct{@TinyNumber var someNumber : Int }
var someStruct = SomeStruct()
someStruct.someNumber = 4
print(someStruct.$someNumber) //false 출력
someStruct.someNumber = 55
print(someStruct.$someNumber) //true 출력
```

`projectedValue`를 사용하여 어떤 타입의 값도 반환할 수 있습니다. `projectedValue`로 인스턴스를 노출하기 위해서`self`키워드를 반환 할 수 있습니다.
```swift
enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width // self 생략가능
    }
}
```

## 전역과 지역변수
**전역(global)** 과 **지역(local)** 변수에서도 Observer와 Wrapper를 사용할 수 있습니다.
> 전역 상수와 변수는 `Lazy Stored Properties`와 유사한 형식으로 항상 느리게 계산됩니다. 이때 `Lazy`키워드는 불필요합니다.

## Type Properties(타입 프로퍼티)
타입의 새로운 인스턴스를 만들떄마다 고유한 프로퍼티 값을 설정합니다. 생성하는 해당 타입의 인스턴스 수에 관계없이 하나의 복사본만을 가지는 프로퍼티를 **Type Property** 라고 합니다.

타입 프로퍼티는 모든 인스턴스에서 사용할 수 있는 프로퍼티 상수, 모든 인스턴스에 전역인 값을 저장하는 프로퍼티 변수를 정의하는데 유용합니다.
> Stored Type Property는 항상 기본값이 주어져야 합니다.

### Type Property Syntax
Swift에서 Type Property는 타입의 외부 중괄호 내에 정의 부분으로 작성되고 각 타입 프로퍼티에 지원되는 형식으로 명시적인 범위가 지정됩니다.

`static`키워드를 사용하여 타입 프로퍼티를 정의합니다. class의 `computed type proprety`의 경우는 `class`키워드를 사용하여 하위 클래스에서 상위 클래스의 구현을 재현할 수 있습니다.
```swift
//각 타입별 타입 프로퍼티 생성
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
```

### Type Property 조회와 설정
Type propety는 인스턴스 프로퍼티처럼 점 구문으로 호출되지만 인스턴스가 아닌 **Type**에 대해 조회되고 설정합니다.
```swift
//예제
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel : Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
```