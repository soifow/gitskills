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
var bucketList: [String] = ["Climb Mt. Everest"]



