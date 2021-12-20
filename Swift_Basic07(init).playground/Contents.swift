import UIKit
import Darwin


//Struct의 멤버별 초기화 구문

struct Size{
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width:2.0,height:2.0)
dump(twoByTwo)
//초기화 구문 위임
struct Point{
    var x=0.0, y=0.0
}

let origin = Point()
struct Rect {
    var origin = Point()
    var size = Size()
    
    init(){}
    
    init(origin:Point,size:Size){
        self.origin = origin
        self.size = size
    }
    
    init(center:Point, size: Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin :Point(x:originX,y: originY),size : size) //초기화 구문 위임
    }
}

var test = Rect(origin: origin, size: twoByTwo)

//Class의 초기화 구문 상속과 재정의
class Vehicle{ //기본 클ㄹ래스
    var numberOfWheels = 0
    var description : String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle : \(vehicle.description)")

class Bicycle : Vehicle {// 기본 클래스 Vehicle 상속
    override init(){ // 초기확 구문 상속
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle : \(bicycle.description)")

class Hoverboard : Vehicle {
    var color : String
    init(color : String) { // 상위 클래스 초기화 구문 암시적 호출
        self.color = color
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color : "sliver")
print("Hoverboard : \(hoverboard.description)")

// 초기화 구문 동작
class Food {
    var name : String
    init(name:String){
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name : "Bacon") // init(name:) 지정 초기화 구문 실행

let mysteryMead = Food() //init() 편의 초기화 구문 실행

class RecipeIngredient : Food {
    var quantity : Int
    init(name : String, quantity : Int){ //상위 클래스의 지정 초기화 구문으로 위임
        self.quantity = quantity
        super.init(name:name)
    }
    override convenience init(name : String){
        self.init(name: name, quantity : 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let onBacon = RecipeIngredient(name : "Bacon")
let sixEggs = RecipeIngredient(name : "Eggs",quantity: 6)

class ShoppingListItem : RecipeIngredient {
    var purchased = false
    var description : String {
        var output = "\(quantity) x \(name)"
            output += purchased ? " ✔" : " ✘"
            return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name : "Bacon"),
    ShoppingListItem(name : "Eggs", quantity : 6),
]
breakfastList[0].name = "Orange juiice"
breakfastList[0].purchased = true
for item in breakfastList{
    print(item.description)
}
