//: Playground - noun: a place where people can play

import UIKit

//泛型
//func show(para: Int) {
//    print("Hello \(para)")
//}
//func show(para: String) {
//    print("Hello \(para)")
//}
//func show(para: Double) {
//    print("Hello \(para)")
//}
//使用了节点类型命名(在定义时不表示任何具体类型，被调用时根据传入的实际类型指定自身类型)
//func show<T>(para: T) {
//    print("Hello \(para)")
//}
//show(para: "小明")
//show(para: 12)

//可以要求节点遵循某种协议
//public func ==<Element : Equatable>(lhs: [Element], rhs: [Element]) -> Bool
//用where可以进一步对节点进行约束
//func anyCommonElements <T:Sequence, U:Sequence>(lhs: T, _ rhs: U) -> Bool where T.Iterator.Element:Equatable, T.Iterator.Element == U.Iterator.Element {
//    return true
//}
//
////泛型协议  关键字 associatedtype
//protocol SomeProtocol {
//    associatedtype Element
//    func elementMethod1(element:Element)
//    func elementMethod2(element:Element)
//}




//var statusCode: Int = 418
//var errorString: String = "The request failed with the error:"
//
//switch statusCode {
//case 100, 101:
//    errorString += " Informational, \(statusCode)."
//case 204:
//    errorString += " Successful but no content, 204."
//case 300...307:
//    errorString += " Redirection, \(statusCode)."
//case 400...417:
//    errorString += " Client error, \(statusCode)."
//case 500...505:
//    errorString += " Server error, \(statusCode)."
//case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
//    errorString = "\(unknownCode) is not a known error code."
//default:
//    errorString = "Unexpected error encountered."
//}
//let error = (code: statusCode, error: errorString)
//error.code
//error.error
//
//
//let firstErrorCode = 304
//let secondErrorCode = 204
//let errorCodes = (firstErrorCode, secondErrorCode)
//
//switch errorCodes {
//case (404, 404):
//    print("No Items found.")
//case (404, _):
//    print("First item not found.")
//case (_, 404):
//    print("Second item not found.")
//default:
//    print("All items found.")
//}
//
//
//let point = (x: 1, y:4)
//switch point {
//case let q1 where (point.x > 0) && (point.y > 0):
//    print("\(q1) is in quadrant 1")
//case let q2 where (point.x < 0) && (point.y > 0):
//    print("\(q2) is in quadrant 2")
//case let q3 where (point.x < 0) && (point.y < 0):
//    print("\(q3) is in quadrant 3")
//case let q4 where (point.x > 0) && (point.y < 0):
//    print("\(q4) is in quadrant 4")
//case (_, 0):
//    print("\(point) sits on the x-axis")
//case (0, _):
//    print("\(point) sits on the y-axis")
//default:
//    print("Case not covered.")
//}
//
//let age = 25
//if case 18...35 = age, age >= 21, age < 30 {
//    print("In cool demographic and of drinking age")
//}

//var myFirstInt: Int = 0
//for i in 1...5 {
//    myFirstInt += 1
//    myFirstInt
//    print(myFirstInt)
//}
//
//for i in 1...100 where i % 3 == 0 {
//    print(i)
//}

//var i : Int = 0
//while i <= 100 {
//    if i % 3 == 0 && i % 5 == 0 {
//        print("FIZZ BUZZ.")
//    } else if i % 3 == 0 {
//        print("FIZZ.")
//    } else if i % 5 == 0 {
//        print("BUZZ.")
//    } else {
//        print(i)
//    }
//
//    i += 1
//}

//let oneCoolDude = "\u{1F60E}"
//let aAcute = "\u{0061}\u{0301}"
//let playground = "Hello, playground"
//for scalar in playground.unicodeScalars {
//    print("\(scalar.value)")
//}



var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?
//print(errorCodeString)

//if errorCodeString != nil {
//    let theError = errorCodeString!
//    print(theError)
//}

//if let theError = errorCodeString {
//    if let errorCodeInteger = Int(theError) {
//        print("\(theError): \(errorCodeInteger)")
//    }
//}

if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
//    print("\(theError): \(errorCodeInteger)")
    errorDescription = "\(errorCodeInteger + 200): resource was not found."
}

var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription

upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription

//var errorCodeString: String! = nil
//let anotherErrorCodeString: String = errorCodeString
//let yetAnotherErrorCodeString = errorCodeString

//var bucketList: Array<String>
//var bucketList: [String] = ["Climb Mt. Everest"]
//var newItems = [
//                "Fly hot air balloon to Fiji",
//                "Watch the Lord of the Rigs trilogy in one day",
//                "Go on a walkabout",
//                "Scuba dive in the Great Blue Hole",
//                "Find a triple rainbow"
//                ]
//for item in newItems {
//    bucketList.append(item)
//}
//bucketList += newItems
//bucketList
//bucketList.remove(at: 2)
//bucketList[0...2]
//bucketList[2] += " in Australia"
//bucketList[0] = "Climb Mt. Kilimanjaro"
//bucketList.insert("Toboggan across Alaska", at: 2)
//bucketList

//创建字典的几种格式
//var dict1: Dictionary<String, Double> = [:]
//var dict2 = Dictionary<String, Double>()
//var dict3: [String:Double] = [:]
//var dict4 = [String:Double]()

//var movieRatings = ["Donnie Darko":4, "Chungking Express":5, "Dark City":4]
//print("I have rated \(movieRatings.count) movies.")
//
//let darkoRating = movieRatings["Donnie Darko"]
//movieRatings["Dark City"] = 5
//movieRatings
//let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
//if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
//    print("Old rating: \(lastRating); current rating: \(currentRating)")
//}
//movieRatings["The Cabinet of Dr. Caligari"] = 5
////movieRatings.removeValue(forKey: "Dark City")
//movieRatings["Dark City"] = nil
//for (key, value) in movieRatings {
//    print("The movie \(key) was rated \(value).")
//}
//
//for movie in movieRatings.keys {
//    print("User has rated \(movie).")
//}
//
//let watchedMovies = Array(movieRatings.keys)
//
//let zipCodeDice = [
//                   "Beijing":[100192, 100193, 100194, 100195, 100196],
//                   "Shanghai":[200111, 200112, 200113, 200114, 200115],
//                   "Guangzhou":[310801, 310802, 310803, 310804, 310805]
//                   ]
//var zipCodeArr : [Int] = Array()
//for zipCode in zipCodeDice.values {
//    zipCodeArr += zipCode
//}
//print("Georgia has the following zip codes:\(zipCodeArr)")

//var groceryBag = Set<String>()
//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapple")
//var groceryBag = Set(["Apples", "Oranges", "Pineapple"])
//var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]
//for food in groceryBag {
//    print(food)
//}
//
//let hasBananas = groceryBag.contains("Bananas")
//let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
//let commonGroceryBag = groceryBag.union(friendsGroceryBag)
//
//let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
//let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)


func printGreeting() {
    print("Hello, playground.")
}
printGreeting()

//形参
//func printPersonalGreeting(name: String) {
//外部参数to 内部参数name(增加可读性)
func printPersonalGreeting(to name: String) {
    print("Hello \(name), welcome to your playground.")
}
//printPersonalGreeting(name: "HaiLang")
printPersonalGreeting(to: "Matt")

//可变参数(只能有一个可变参数且通常为参数表最后一个，参数类型后加... 函数内部把该参数视为数组)
func printPersonalGreetings(to names: String...) {
    for name in names {
        print("Hello \(name), welcome to your playground.")
    }
}
printPersonalGreetings(to: "Alex", "Chris", "Drew", "Pat")

//func divisionDescriptionFor(numerator: Double, denominator: Double) {
//    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)")
//}
//divisonDescriptionFor(numerator: 9.0, denominator: 3.0)

//func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") {
//    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
//}
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!")

func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
}
print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0))
print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))

var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)

func grabMiddleName(fromeFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromeFullName: ("Matt" , nil, "Mathias"))
if let theName = middleName {
    print(theName)
}

func siftBeans(fromGroceryList list: [String]) -> (beans:[String], otherGroceries:[String]) {
    var beans = [String]()
    var others = [String]()
    for name in list {
        if name.hasSuffix("beans") {
            beans.append(name)
        } else {
            others.append(name)
        }
    }
    
    return (beans, others)
}

let result = siftBeans(fromGroceryList: ["green beans",
                                         "milk",
                                         "black beans",
                                         "pinto beans",
                                         "apples"])
result.beans == ["green beans", "black beans", "pinto beans"]
result.otherGroceries == ["milk", "apples"]

