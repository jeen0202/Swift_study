import UIKit

class ShoppingListItem{
    var name : String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
dump(item)

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
