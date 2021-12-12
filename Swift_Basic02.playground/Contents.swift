import UIKit
/**
 ## Swift의 조건문
 - Swift는 if와 switch 2개의 조건문이 존재합니다. (+ guard)
 ### IF 구문
 - if-else 키워드를 사용해 조건에 따라 다르게 실행되는 구문을 작성할 수 있습니다.
 - Swift의 if문의 조건부는 Bool 형태의 데이터만 처리할 수 있습니다.
 ```swift
 if 조건1 {
    실행 1
 }
 else if 조건2 {
    실행 2
 }
 else {
    실행 3
 }
 ```
 */
let first : Int = 1
let second : Int = 2

if first > second {
    print("fist > second")
} else if first < second {
    print("fisrt < second")
} else {
    print("fisrt == second")
}
/**
 ### Switch 구문
 - 기존 switch문과 유사하며 break키워드 사용을 통한 중단이 가능합니다.
 - case의 연속 실행을 위한 fallthrough 키워드가 존재합니다.
 - 조건 구분을 위한 case에 정수가 아닌 다른 값을 사용할 수 있습니다.
 - 비교 값의 default를 지정해야 합니다.
 - 범위 연산자(..), where절을 사용하여 조건을 확장할 수 있습니다.
 ```swift
 switch 입력 값{
 case 비교값1 :
    실행1
 case 비교값2 :
    실행2
    fallthrough // case종료시 switch구문을 종료하지 않음
 case 비교값3,비교값4, 비교값5 :
    실행3
    break
 default:
    실행4
 }
 ```
 */
let integerValue : Int = 5

switch integerValue {
case 0:
    print("Value == Zero")
case 1...10:
    print("Value in 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value <0 or Value > 100")
default :
    print("10<value <= 100")
}
// Swift의 Switch문에서는 case내부의 실행코드 생략이 불가능 합니다.
let num : Int = 3
switch num {
case 0:
    fallthrough
case 1:
    fallthrough
case 2:
    fallthrough
case 3:
    print("num>=3")
default :
    print("num < 4")
}
/**
 ### 반복문
 - 전통적인 C-Style의 for문 대신 for-in문을 사용합니다.
 - do-while 구문은 repeat-while 구문으로 구현됩니다.
 for-in 구문
 ```swift
 for 임시 상수 in 시퀀스 아이템 {
    실행부
 }
 ```
 */
for i in 0...5{
    if i.isMultiple(of: 2){//2배수인지를 확인
        print(i)
        continue// continue 아래의 코드는 무시하고 다음 시퀀스 실행
    }
    print("\(i) == 홀수")
}
var result : Int = 1
for _ in 1...3 {
    result *= 10
}
print ("10의 3제곱은 \(result)입니다.")
//for-in구문과 collection 자료형의 조합
let friends:[String:Int] = ["Kim": 20, "Lee": 22, "Park": 21]

for (key,value) in friends{
    print(key,value)
}
/**
 While 구문
 Bool 자료형으로 구분되는 조건을 만족하는 동안 반복 실행됩니다.
 */
var names :[String] = ["Sejing","SR","Author","Juwon"]

while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")
}
/**
 repeat-while구문
 - 기존 프로그램언어의 do-while 구문과 비슷한 역할을 수행합니다.
 */
var ages : [Int] = [10,20,30,40]
repeat{
    print("Your in \(ages.removeFirst()) Ages")
} while ages.isEmpty == false
/**
 ### 구문 이름표
 - 반복문의 제어를 위해 반복문에 이름을 붙여 독립적으로 제어할 수 있습니다.
 */
var numbers : [Int] = [3,2342,6,12356]

numbersLoop : for num in numbers{
    if num > 5 || num < 1{
        continue numbersLoop
    }
    var count : Int = 0
    
    printLoop : while true{
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
    }
    
    removeLoop : while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}

print(numbers)

