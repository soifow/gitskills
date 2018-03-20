//: Playground - noun: a place where people can play

import UIKit

//变量声明 & 格式化输出变量(let声明常量)
var str = "Hello, playground"
print("what I want to say is \(str)")

//元组声明
let message = ("getMessageList", 404, "未找到接口名")
//用元组初始化另一个元组，且只获取感兴趣的部分
let (_,_,msgToUser) = message
print("错误：\(msgToUser)")

//可选型
var age:Int?
age = Int("12")
print("age is \(age)")
//对可选型解包操作(确信可选型有值时取值操作)【强制解包】
print("age is \(age!)")

//可选型的??操作(类似三目运算符?:)，??操作自带强制解包，可选型(Int("12")返回的是个可选型)解包成功时解包，否则返回后面的非可选值
var age2:Int
age2 = Int("12") ?? -1  //转型成功
age2 = Int("小明") ?? -1  //转型失败

//可选型的可选绑定
var age3:Int? = Int("12")
if let a = age3 {
    print(a)
}

func findA() {
    guard let b = age3 else {
        return
    }
    print(b)
}

//基本运算符
//+可直接连接字符串，%可对小数做运算
"嘻嘻"+"哈哈"
5 % 2

//范围(类似NSRange) 1...5 闭区间    1..<5 闭开区间
//通常用于循环 or switch的case条件
for index in 1..<5
{
    print(index)
}

//判断字符串相等
let string1 = "哈哈"  //(String)
let string2 = string1
if string1 == string2 {
    print(true)
}

//类型转换
var string3 : NSString = string1 as NSString

//range
let num = "123.45"
let deRange = num.range(of: ".")
let wholeNum = num[num.startIndex ..< deRange!.lowerBound]

var testRemoveStr = "Hello"
let startIndex = testRemoveStr.index(testRemoveStr.startIndex, offsetBy: 1)
let endIndex = testRemoveStr.index(testRemoveStr.startIndex, offsetBy: 3)
testRemoveStr.removeSubrange(startIndex...endIndex)

//声明可变数组并往里面增加值
var testMutableArray1 = ["元素1", "元素2", "元素3"]
testMutableArray1 += ["元素4", "元素3"]
testMutableArray1.append("元素2")

//取值、修改、替换(替换元素的个数和指定元素可以不同)
testMutableArray1[1] = "元素13"
testMutableArray1[2...3] = ["元素12"]
print(testMutableArray1)

//插值
testMutableArray1.insert("元素14", at: 2)
if !testMutableArray1.isEmpty {
    testMutableArray1.removeLast()
}

//集合(类似数组：不含重复元素，无序)
var exampleOfSet:Set = ["元素1", "元素2", "元素3", "元素4", "元素3"]  //由于花括号与闭包语法格式相同，因此集合需要借助数组赋值的方式，并显示声明

//字典
var exampleOfDic = [String:Int]()   //字典初始化 存放Int类型的字典(要求存放的数据同类型)
exampleOfDic = ["key1":1, "key2":2] //赋值
exampleOfDic["key3"] = 3    //增加/修改某键值对
exampleOfDic["key2"] = nil  //删除某key

//遍历字典
for (key,value) in exampleOfDic {
    print("\(key) is \(value)")
}
//分别遍历key or value
for value in exampleOfDic.values {
    print("value is \(value)")
}

//while
var index1 = 5, index2 = 5
while index1 > 5 {
    print(index1)
}

repeat {
    index2 -= 1
    print(index2)
} while index2 > 5

//guard关键字，类似if，只不过当条件为假时执行花括号内的数据，并且需要在花括号内部return or break，用来解决if的多级嵌套判断用

var bookPrice = 56
switch bookPrice {
case 60..<80:
    print("并不是很贵，考虑一下")
case 0...60:
    print("果断出手")
    fallthrough
default:
    print("太贵了！")
}

//参数string 返回string
func exampleOfFunc(name:String) -> String {
    let sayHello = "Hello \(name)"
    return sayHello
}

exampleOfFunc(name: "xixi")

func plus(a:Int, b:Int) -> Int {
    return a + b
}

func mult(a:Int, b:Int) -> Int {
    return a * b
}

//以函数为参数
func doSomeFunction(parameter:(Int, Int) -> Int, a:Int, b:Int) {
    print("运算结果为\(parameter(a,b))")
}

doSomeFunction(parameter: plus, a: 3, b: 4)
doSomeFunction(parameter: mult, a: 2, b: 5)

//可变数量的参数（一个函数只有最后一个参数数量可变）
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(numbers: 1,2,3))
print(arithmeticMean(numbers: 1,2,3,4,5))

//输入输出参数
func testInOutPara(parameter: inout String) -> String {
    parameter = "Hello \(parameter)"
    return parameter
}

var name = "小明同学"
print(testInOutPara(parameter: &name))
print(name)

//函数重载(返回值不同也可以)
func testOverloaded(s:String) -> Int {
    print("Int")
    return 2
}

func testOverloaded(s:String) -> String {
    print("String")
    return s
}

let intValue:Int = testOverloaded(s: "")
let stringValue:String = testOverloaded(s: "")

func foundIndex(for element:Int, in collection:[Int]) -> Int? {
    for (index, e) in collection.enumerated() {
        if e == element {
            return index
        }
    }
    return nil
}

foundIndex(for: 3, in: [1,2,3,2,4])

