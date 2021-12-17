Optionals
===  
<small>1. _Value가 존재하지 않는 경우_
2. _Value가 존재하고 Optional을 풀어서 Value에 접근하는 경우_</small>
2가지의 가능성을 가지고 있는 타입입니다.
<small>_예시_
```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//변환에 실패할수있으므로 convertedNumber는 optional Int타입이 됩니다.
```
자료형 뒤에 `?`키워드를 사용하여 optional함을 나타낼 수 있습니다.
```swift
var testOptionalInt : Int?
var testOptionalStr : String?
```
### nil
_`nil`키워드를 사용하여 optional 변수에 지정된 값이 없는 상태를 나타낼 수 있습니다._
```swift
var serverResponseCode : Int? = 404
var serVerResponseCode = nil
```
> 초기값을 지정하지 않는 Optional 변수는 nil로 초기화 됩니다.

<small>_Optional이 아닌 상수/변수에는 nil을 사용 할 수 없습니다._

## IF문과 Optioanl
if 구문으로 optional의 Value가 존재하는지 파악할 수 있습니다.
```swift
if testOptional != nil{
    //Optional에 값이 존재할 경우 실행
}
```
___forced unwrapping___을 통해 Optional Value에 접근 할 수있습니다. 이 경우 Optioanl에 Value가 존재하지 않으면 런타임 에러가 발생합니다.
```swift
var forcedUnwrap01 : Int? = 100
var forcedUnwrap02 : Int?
print("forced unwrap : \(forcedUnwap01!)")
print("forced unwrap : \(forcedUnwap02!)") //런타일 에러 발생
```
## Optional Binding
_Optinal Binding_ 은 Optional에 Value가 존재하는지 확인하고 Value가 존재할 경우 해당 Value를 임시 상수/변수로 사용할 수 있게 해줍니다.
<small>_예시_</small>
```swift
if let/var [상수/변수명] = [Optional] {
    임시상수/변수로 Optional Value 사용
}
```
쉼표로 구분하여 여러 Optional binding을 한번에 실행할 수 있습니다.
```swift
if let firstNumber = Int("4"),let secondNumber = Int("42"){
    //조건이 모두 만족되면 실행
}
```
> Optional Binding으로 생성된 상수와 변수는 if구문 안에서만 사용가능합니다.
## 암시적 Unwrapping
Optional 생성시 `!`키워드를 사용하여 unwrapping된 Optional을 생성 할 수 있습니다.
암시적 Unwapping이 수행되면 내부적으로는 Optional로 인식되지만 Optional이 아닌 것 처럼 Value에 접근 할 수 있습니다.
```swift
let possibleString : String? = "Optinal String"
let forcedString : String = possibleString!//unwrap 필요

let assumedString : String! = "implicitly unwrapped Optinal String"
let implicitString : String = assumedString //unwrap 불필요
```

> 나중에라도 변수가 `nil`이 될 가능성이 있을경우에는 암시적 unwrapping을 사용하지 않는 것이 바람직 합니다.