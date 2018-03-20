//: Playground - noun: a place where people can play

import UIKit

//闭包
/*
{ (参数列表) -> 返回值类型 in
    语句组
}
 */
func someFunction(op:String) -> (Int, Int) -> Int {
    var result : (Int, Int) -> Int
    switch (op) {
    case "+":
        result = {(a:Int, b:Int) -> Int in
            return a + b
        }
    default:
        result = {(a:Int, b:Int) -> Int in
            return a * b
        }
    }
    return result
}

let showPlus:(Int,Int)->Int = someFunction(op: "+")
print("3+4=\(showPlus(3,4))")
let showMult:(Int,Int)->Int = someFunction(op: "*")
print("3*4=\(showMult(3,4))")

let plus:((Int, Int)) -> Int = { x in
    return x.0 + x.1
}




























