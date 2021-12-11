import UIKit

var greeting = "Hello, playground"
dump(greeting)

//Swift  문자열 보간
print("\(greeting)")

//변수와 상수
var name : String = "Sejing" //변수 생성을 위한 키워드 var
name = "Sejing Kim"

let cname : String = "Juwon" //상수 생성을 위한 키워드 let
// cname = "Juwon Cha" 상수 재할당 불가능
//변수의 자료형 확인
type(of:name)
//정수형(Int/UInt)
var x1 : Int = -100
var x2 : UInt = 300
//c언어의 unsigned int와 마찬가지로 UInt는 양의 정수만 표현가능
print("Int의 최대값 : \(Int.max), Int의 최소값 : \(Int.min)")
print("UInt의 최대값 : \(UInt.max), UInt의 최소값 : \(UInt.min)")
//표현가능 범위는 동일함

//진법 표현(2,8,16)
let binary : Int = 0b110101
let octal : Int = 0o734
let hexadecimal : Int = 0x9A2C

//Bool형
var boolean : Bool = true
boolean.toggle() // Bool형 데이터의 값을 반전 true <-> false

//실수형
var float : Float = 123.456 // 6자리의 10진수 표현 가능
var double : Double = 123456.12357 // 15자리의 10진수 표현 가능

//문자형(Character)과 문자열형(String)
var character1 : Character = "A"
var string : String = String() //빈 문자열 생성
string.append("Sejing") //문자열에 값 추가
var greet = "Hello My Name is " + string
print(greet)
//문자열 내장함수
greet.count // 글자 수 반환
greet.isEmpty // 빈 문자열확인
//대소문자로 변환
greet.uppercased()
greet.lowercased()
/**
 Swift의 특수문자
 - ``\n`` : 줄바꿈
 - ``\\\`` : 문자열 내에서의 백슬래시
 - ``\"`` : 문자열 내에서 큰따옴표
 - ``\t`` : 탭 문자
 - ``\0`` : null문자
 */

//Any : Swift의 모든 자료형 사용가능한 변수
var anytest : Any = 1
anytest = 10.1
anytest = "Hello"
anytest = true
//AnyObject : 클래스의 인스턴스 할당가능

//datatype 추론
var str1 = "S8ejing"
var num1 = 10
//type 별칭
typealias MyInt = Int
let num2 : MyInt = 100

//Tuple : 자료형의 나열로 생성가능
var Person : (String,Int,Double) = ("Sejing",28,123.4)
//Index 사용 가능
print("이름 : \(Person.0), 나이 : \(Person.1), 키 : \(Person.2)")
//요소의 이름지정 가능
var Person2 : (name : String, age : Int, height : Double) = ("Kim",28,123.4)
//Index 대신 요소이름으로 호출 가능
Person2.name = "Sejing"
//Tuple의 별칭 지정 가능
typealias DogTuple = (name : String, age : Int, weight : Double)
let happy : DogTuple = ("happy",2,4.2)
print("이름 : \(happy.name), 나이 : \(happy.age), 무게 : \(happy.weight)")
//배열(Array) : 같은 자료형의 데이터를 일렬로 나열한 형의 자료형
var names : Array<String> = ["Kim", "Lee", "Park"]
var names2 : [String] = ["Park","Lee","Kim"] // 축약 가능
var empty1 : [Any] = [Any]()
var empty2 : [Any] = Array<Any>()
var empty3 : [Any] = []
//Array의 메서드
names.append("Choi")
names.insert("Cha",at:2)
names.insert(contentsOf: ["Shin","Song"], at:3)
print(names)
//Index 검색
names.firstIndex(of: "Song")
names.firstIndex(of: "Kyung") // 검색 실패시 nill 반환
//
names.first// 첫요소
names.last// 끝요소
//특정 인덱스 범위 설정
print(names[2...4])

//사전형(Dict)
var dict : Dictionary<String,Int> = Dictionary<String,Int>()
var dict2 : [String:Int] = [String :Int]()
var dict3 : [String:Int] = [:]
//Dict의 내장 메서드
var numberToName :[String:Int] = ["Kim":100, "Lee":200,"Cha":300]
print(numberToName.isEmpty)
print(numberToName.count)
print(numberToName["Kim"]) //Value 출력
numberToName["Park"] = 400
print(numberToName)

numberToName.removeValue(forKey: "Lee")
print(numberToName)


