import UIKit

class DataImporter{
    var filename = "data.txt"
}

class DataManager {
    //Lazy Property 생성
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// manager의 importer 미생성
print(manager.importer.filename)

struct Point{
    var x = 0.0, y = 0.0
}
struct Size{
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    //Computed Property
    var center: Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height/2)
            return Point(x:centerX,y:centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}

var square = Rect(origin: Point(x:0.0,y:0.0),size:Size(width:10.0,height:10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now (\(square.origin.x),\(square.origin.y))")
// 짧은 getter와 setter
struct CompactRect{
    var origin = Point()
    var size = Size()
    var center : Point {
        get{
            Point(x: origin.x + (size.width/2),y: origin.y + (size.height/2))
        }
        set{
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}
//read-only property
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    var volume : Double{
        return width * height * depth
    }
}
let fourbyFiveTwo = Cuboid(width: 4.0,height: 5.0,depth: 2.0)
print ("volume is \(fourbyFiveTwo.volume)")

// Property Observer

class StepCounter{
    var totalSteps : Int = 0 {
        //willSet, didSet은 새로운 값이 프로퍼티에 할당될때마다 호출됩니다.
        willSet(newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }
        // didSet Observer는 totalSteps의 값이 변경된 이후에 호출됩니다.
        // oldValue는 변경 이전의 값에 대한 기본 파라미터명입니다.
        didSet{
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//Property Wrapper
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue : Int {
        get {return number}
        set {number = min(newValue,12)}
    }
}

//Wrapper 적용
struct SmallRect{
    @TwelveOrLess var height : Int
    @TwelveOrLess var width: Int
}

var rect = SmallRect()
print(rect.height)
rect.height = 10
print(rect.height)
rect.height = 24
print(rect.height)
