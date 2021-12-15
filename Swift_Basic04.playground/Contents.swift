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
