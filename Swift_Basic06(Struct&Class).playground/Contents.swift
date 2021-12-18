import UIKit

//Structure
struct YoutuberStruct {
    var name : String
    var subscriberCount : Int
}

var janjanDev = YoutuberStruct(name:"잔잔바리",subscriberCount: 10000)

var janjanDevClone = janjanDev

print("잔잔 클론 :",janjanDevClone.name)

janjanDevClone.name = "잔잔카피"

print("잔잔 클론 :",janjanDevClone.name)

print("잔잔바리코딩 :",janjanDev.name)
//동일한 Item이 아닌 값 복사 이기 때문에 변경사항이 영향을 미치지 않습니다.

//Class
class YoutuberClass{
    var name : String
    var subscriberCount : Int
    //초기화 필요
    init(_ name : String, _ count : Int){
        self.name = name
        self.subscriberCount = count
    }
}
var janjanClass = YoutuberClass("잔잔바리",19999)
var janjanClassClone = janjanClass

print("클래스 클론 변경전:",janjanClassClone.name)

janjanClassClone.name = "잔잔카피"

print("클래스 클론 변경후 :",janjanClassClone.name)

print("변경후 원본 :",janjanClass.name)

//Class는 값 복사가 아닌 참조 복사이기 때문에 원본이 유지되지 않습니다.
