import UIKit
import Foundation

enum School {
//    case elementary
//    case middle
//    case high
    case elementary,middle,high

}
let yourSchool = School.high
print("your School : ",yourSchool)

enum Grade : Int {
    case fisrt = 1
    case second = 2
}

let yourGrade = Grade.second
let yourGrade_raw = Grade.second.rawValue
print("your Grade : ",yourGrade)
print("your Grade_rawValue : ",yourGrade_raw)

enum SchoolDetail {
    case elementary(name : String)
    case middle(name : String)
    case high(name : String)
    
    func getName() -> String {
        switch self {
        case .elementary(let name):
            return name
        case let .middle(name):
            return name
        case let .high(name):
            return name
        }
    }
}
let yourMiddleSchoolName = SchoolDetail.middle(name : "잔잔바리중학교")
print("yourMiddleShcoolName : ",yourMiddleSchoolName.getName())
// Recursive Enumbertions
indirect enum ArithmeticsExpression{
    case number(Int)
    case addition(ArithmeticsExpression,ArithmeticsExpression)
    case multiplication(ArithmeticsExpression,ArithmeticsExpression)
}
let five = ArithmeticsExpression.number(5)
let four = ArithmeticsExpression.number(4)
let sum = ArithmeticsExpression.addition(five, four)
let product = ArithmeticsExpression.multiplication(sum, ArithmeticsExpression.number(2))
// 연산 수행을 위한 함수
func evaluate(_ expression: ArithmeticsExpression) -> Int{
    switch expression{
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(sum))
print(evaluate(product))
