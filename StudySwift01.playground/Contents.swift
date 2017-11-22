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

