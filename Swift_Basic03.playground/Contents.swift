import UIKit

var isDarkMode : Bool = true

//if isDarkMode{
//    print("다크모드입니다.")
//}else{
//    print("다크모드가 아닙니다.")
//}

//3항 연산자를 사용한 변수할당
var title : String = isDarkMode ? "다크모드입니다.":"다크모드가 아닙니다"

print("title : \(title)")

//for-each 반복문
//Collection : 데이터의 집합
//Array,Set,Dictionary, Tuple
var myArray : [Int] = [0,1,2,3,4,5,6,7,8,9,10]
for item in myArray{
    print("item : \(item)")
}
//item에 조건을 추가하기위한 where절
for item in myArray where item > 5{
    print("5 이상 의 수 : \(item)")
}
for item in myArray where item % 2 != 0 {
    print("짝수 : \(item)")
}

