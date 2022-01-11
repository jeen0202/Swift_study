import UIKit

// func,method 정의
func myFunction(name : String) -> String{
    return "안녕하세요 \(name) 입니다!"
}

//func,method call(호출)
myFunction(name: "잔잔바리")

// parameter의 이름을 호출하면서 변경가능
func myFunctionSecond(with name : String) -> String{
    return "안녕하세요 \(name) 입니다!"
}

myFunctionSecond(with: "Sejing")

// 이름이 없는 Parameter 사용
func myFunctionThird(_ name: String) -> String{
    return "안녕하세요 \(name) 입니다!"
}

myFunctionThird("Sejing")

// 튜플을 사용한 다중값 반환
func minMax(_ array:[Int]) -> (min:Int, max:Int){
    return (array.min()!,array.max()!)
}
let bounds = minMax([3,4,1,2,6,5,8,7,0])
print("min is \(bounds.min) & max i \(bounds.max)")
//옵셔널 튜플 반환 함수
func minMax(array:[Int]) -> (min :Int, max : Int)? {
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin {
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let bounds = minMax(array :[8,-6,2,101,3,44]){
    print("min is \(bounds.min) & max is \(bounds.max)")
}
