# Swift의 Collection Types(Array,Set,Dictionary)
 + Swift에서는 3개의 원시적인 Collection Type을 제공합니다.
 + Swift의 Collection Type은 저장할수 있는 데이터의 Type과 Key대해 항상 명확해야합니다.
##  Collection Type의 가변성
 + 배열(Array),집합(Set),사전(Dictionary)을 변수로 성언하여 할당하면, 생선된 Collection의 아이템을 추가/삭제/변경할수 있습니다.
 + 상수로 선언된 Collection Type은 크기 및 콘텐츠를 변경할 수 없습니다.
 > Swift Compiler의 성능 최적화를 위해서는 변경할 필요가 없는 Collection은 상수로 선언하는것이 유리하다.
## 배열(Arrays)
- 순서대로 같은 자료형의 데이터를 저장하는 변수
- 동일한 값이 배열에 다른 순서상에 존재할 수있습니다.(값 중복가능)
저장할 배열값의 자료형 ```Element```는 ```Array<Element>```형태로 작성되며 ```[Element]```로 작성될 수도있습니다.
### 빈 배열 생성
```swift
var empty1 : [Any] = [Any]()
var empty2 : [Any] = Array<Any>()
var empty3 : [Any] = []
//빈 배열로 초기화(내부값의 자료형 유지)
var empty1 = []
```
### 기본값 배열 생성
기본값과 크기를 설정하여 기본값이 크기만큼 반복되는 배열생성 가능
```swift
var defaultArray = Array(repeating: 기본값, count:배열크기)
```
### 리터럴을 통한 배열 생성
```swift
var literalArray : [자료형] = [값1,값2,값3]
```
### 배열 접근과 수정
+ count : 배열의 아이템 갯수를 확인하기 위한 읽기전용 키워드
+ isEmpty : 배열의 ```count```값이 0일경우 ```true```를 반환하는 bool함수
+ append(_:) : 배열의 맨끝에 새로운 아이템을 추가하는 키워드
    + 하나 이상의 동등한 아이템의 배열 추가를 위한 덧셈대입 연산자```+=```사용이 가능합니다.<br>

*서브 스크립트 구문*을 사용하여 ```INDEX```위치에 존재하는 배열의 값을 호출할 수 있습니다.
```swift
var fisrtItem = Array[INDEX]
```
*서브 스크립트 구문*을 사용하여 ```INDEX```위치에 존재하는 배열의 값을 변경할 수 있습니다.
```swift
Array[INDEX] = "Modify"
```
*서브 스크립트 구문*으로 범위안의 값을 한번에 변경 할 수 있습니다.
```swift
Array[4...6] = ["Bananas,Apples"]
```
배열의 특정 ```INDEX```에 아이템을 추가하려면 ```insert(_:at:)``` 메서드를 사용합니다.
```swift
Array.insert("Value",at:INDEX)
```
```remove(at:)```메소드를 사용하여 지정한 위치의 값을 삭제하며, 삭제한 아이템 값을 반환합니다.
```swift
removeItem = Array.remove(at:INDEX)
//remove 메서드를 사용하면 배열의 길이가 줄어듭니다.
```
> 배열의 마지막 요소를 삭제하기위핸 매서드 ```removeLast()```가 존재합니다.
### 배열 반복
```for-in```Loop를 사용하여 배열의 전체 값을 알 수 있습니다.
```swift
for item in Array{
    //배열 내부의 아이템을 순서대로 호출합니다.
}
```
배열의 ```INDEX```와```VALUE```을 동시에 호출하기위한 메서드 ```enumerated()```가 존재합ㄴ디ㅏ.
```swift
for (index, value) in Array.enumerated(){
    //index는 item의 위치
    //value는 Array의 요소가 순서대로 호출됩니다.
}
```