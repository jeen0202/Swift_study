import UIKit
import Darwin

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

// 명시적으로 Wrapping 코드를 사용
struct SmallRectangl{
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height : Int {
        get { return _height.wrappedValue}
        set { _height.wrappedValue = newValue}
    }
    var width : Int {
        get { return _width.wrappedValue}
        set { _width.wrappedValue = newValue}
        }
    }

// 3개의 초기화를 포함한 Property Wrapper
@propertyWrapper
struct SmallNumber {
    private var maximum : Int
    private var number : Int
    
    var wrappedValue : Int {
        get { return number}
        set {number = min(newValue,maximum)}
    }
    init () {
        maximum = 12
        number = 0
    }
    init (wrappedValue: Int){
        maximum = 12
        number = min(wrappedValue,maximum)
    }
    init(WrappedValue : Int, maximum : Int){
        self.maximum = maximum
        number = min(WrappedValue,maximum)
    }
}

struct ZeroRectangle{
    @SmallNumber var height : Int
    @SmallNumber var width : Int
}
var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height,zeroRectangle.width)

struct UnitRectangle {
    //init(WrappedValue) 호출
    @SmallNumber var height : Int = 1
    @SmallNumber var width : Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

struct NarrowRectangle{
    @SmallNumber(WrappedValue: 2,maximum : 5) var height : Int
    @SmallNumber(WrappedValue: 3, maximum: 4) var width : Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height,narrowRectangle.width)


//할당을 사용한 초기화
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(WrappedValue: 2 ,maximum: 9) var width
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// Prints "1"

mixedRectangle.height = 20
print(mixedRectangle.height)
// Prints "12"

// Value Project
@propertyWrapper
struct TinyNumber {
    private var number : Int
    private(set) var projectedValue : Bool
    
    var wrappedValue : Int {
        get {return number}
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            }else{
                number = newValue
                projectedValue = false
            }
        }
    }
    init(){
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStruct{
    @TinyNumber var someNumber : Int
}
var someStruct = SomeStruct()

someStruct.someNumber = 4
print(someStruct.$someNumber)
someStruct.someNumber = 55
print(someStruct.$someNumber)
//인스턴스 반환
enum TwoSize{
    case small,large
}
struct SizedRect{
    @TinyNumber var height : Int
    @TinyNumber var width : Int
    
    mutating func resize(to size: TwoSize) -> Bool {
        switch size{
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width // 변경 유무 반환
    }
}

var sizedRect = SizedRect()
sizedRect.resize(to: .large)

func someFunction(){
    @TinyNumber var myNumber : Int
    
    myNumber = 10
    print("change to 10 : \(myNumber)")
    myNumber =  24
    print("change to 24 : \(myNumber)")
}
someFunction()

//Type Properties
struct SomeStructure{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty : Int{
        return 1
    }
}
enum SomeEnumeration{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty : Int{
        return 6
    }
}

class SomeClass{
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty : Int{
        return 27
    }
    class var overrideableComputedTypeProperty : Int {
        return 107
    }
}
//Type Property 조회 및 설정
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another Value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)

//Type Property 예제
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel : Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
