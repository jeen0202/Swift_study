# Functions (함수)
<small> Swift의 ***Functions***은 특정 작업을 수행하는 코드 모음의 형태이며, 이름을 지정하여 `Call(호출)` 할 수 있습니다.</small>

Swift의 통합 함수 구문은 C-Style의 파라미터 이름이 없는 함수에서 각 파라미터에 대한 이름과 인자가 있는 Objective-C Style 메서드까지 유연하게 표현 가능합니다. 함수 호출을 단순화 하기위한 기본값을 제공하며, `in-out 파라미터`를 전달하여 함수의 실행 완료시 전달된 변수를 수정할 수 있습니다.

Swift의 모든 함수에는 함수의 파라미터 타입과 return 타입으로 구성된 Type이 존재합니다. 이러한 형태를 활용하여 함수를 다른 함수에 파라미터로 전달하고 함수에 함수를 반환하기 용이합니다. 함수는 중첩된 범위내에서 유용한 기능을 캡슐화하여 다른 함수에 적용할 수 있습니다.

## 함수 호출과 정의(Defining & Calling Functions)
함수 정의시 하나 이상의 타입값을 ***parameter*** 로 정의할 수 있습니다.또한 `반환(return)타입`을 선택적으로 정의 할 수도 있습니다.

모든 함수는 수행하는 작업을 설명하는 `함수 이름`을 가지며, 함수 사용을 위해서는 함수의 이름으로 `호출`하고 파라미터와 일치하는 입력값을 전달해야합니다. 파라미터의 순서는 변경할 수 없습니다.

```swift
func 함수이름(파라미터명1 : 자료형,파라미터명2 : 자료형 ... ) -> 반환자료형 {
    실행 코드 모음
    return 반환값
}
```
함수가 호출될때 반환값을 무시할 수 있습니다.
```swift
//예시
// 반환값이 있는 함수
func printNCount(string : String) -> Int {
    print(string)
    return string.count
}
//반환값이 없는 함수
func printNotCount(string : String){
    let _ printNCount(String)
    // printNCount(String) -> 단순 호출시 컴파일 에러 발생
}
```
## 여러개의 반환값이 있는 함수(Functions with Multiple Return Values)
**Tuple Type**을 사용하여 단일 혼합형 반환값을 가지는 함수를 정의할 수 있습니다.
```swift
func minMax(array:[Int]) -> (min : Int, max : Int){
    return (array.min, array.max)
}
```

## Optional Tuple 반환 타입
함수의 반환값이 튜플 타입일때, `값이 존재하지 않을 가능성`이 존재하는 경우 `Optional` 반환 타입을 사용하여 전체 튜플이 nil 인 경우에 대응 할 수 있습니다.
```swift
//예시
func minMax(array:[Int]) -> (min :Int, max : Int)? {
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin {
            currentMin = value
        }else if value > currentMax{
            current Max = value
        }
    }
    return (currentMin,currentMax)
}
```