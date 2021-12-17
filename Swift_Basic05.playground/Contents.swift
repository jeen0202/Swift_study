import UIKit

//범위 표시
// 0...5 -> 0부터 5까지
// 0..<5 -> 0부터 4까지
/**
for-each문법
for [iterate] in [Range]{
 실행부
}
 */
for i in 0..<5 {
    print("호호 Index : ",i)
}

//where 절을 사용한 조건 추가
for index in 0...5 where index % 2 == 0{
    print("호호 짝수 index : \(index)")
}
var randomInt: [Int] = []

for _ in 0..<25{
    let randomNumber = Int.random(in: 0...100)
    randomInt.append(randomNumber)
}
print(randomInt)

//옵셔널 변수
// 값의 존재유무를 파악할 수 없는 경우에 사용
var someVariable : Int? = nil

if someVariable == nil {
    someVariable = 90
}
print("someVariable : ",someVariable!)
//unWarping : optinal등으로 Warp되어있는 값을 wapping되지 않은 값으로 변경
if let otherVariable = someVariable{
    print("언래핑 완료 = 값이 존재.")
    print(otherVariable)
}else{
    print("값이 없다.")
}

someVariable = nil

// 기본값 할당
let myValue = someVariable ?? 10
print(myValue)

//unwarpping 함수
func unwarp(parameter : Int?){
    print("unwarp() called")
    guard let unWrappedParam = parameter else{
        return
    }
    print("unWrappedParam : \(unWrappedParam)")
}

var firstValue : Int? = 30
var secondValue : Int? = 50
print("forced unwrap : \(firstValue!)")
unwarp(parameter: firstValue)
unwarp(parameter: secondValue)

