//: Playground - noun: a place where people can play

import UIKit

//类(与oc不同.h .m俩文件，swift创建类只有一个.swift文件)
//声明（类初始化时属性必须都被初始化，变量可以用lazy关键字延迟初始化以解决一些初始化时的耗时操作）
class Student {
    var name: String?
    var age: Int = 10
    lazy var desc: String = "这是延迟加载的属性"
}
//实例化
let classItem = Student()
classItem.name = "haha"

MemoryLayout<Student>.size

let n = NSNumber(value: 12.5)
var intversion = n.intValue

//结构体（Swift中基础类型数据都是结构体而不是类，无论是整数、浮点数、数组 or 字典）
struct Student1 {
    var name: String = ""
    var age: Int = 10
}

let structItem = Student1()

//枚举
enum DataType {
    case IntType
    case DoubleType
}
//取值
DataType.IntType

enum Turn {
    case left
    case right
    var reminder:String {
        //枚举内部访问case
        switch self {
        case .left:
            return "左转"
        case .right:
            return "右转"
        }
    }
}

//计算属性
class newClass {
    var firstName = "新"
    var lastName = "小明"
    var allName:String {
        get {
            return lastName + firstName
        }
    }
    
    var nowPet = ""
    var changePet:String {
        get {
            return nowPet
        }
        
        set (newPet) {
            nowPet = newPet
        }
    }
}

var name = newClass()
name.allName


struct SomeStruct {
    var intValue = 0
    var stringValue = ""
    
    func printIntValue() {
        print(intValue)
    }
    
    var intValueToString:String {
        get{
            return "\(intValue)"
        }
    }
    
//    mutating func intValuePlus() {
//        intValue += 1
//    }
    
    var intValuePlus:Int {
        get{
            return intValue
        }
        
        set{
            intValue += newValue
        }
    }
}

var s = SomeStruct(intValue: 3, stringValue: "")
s.intValuePlus = 1
s.intValuePlus

MemoryLayout<SomeStruct>.size

var exampleOfProperty:Int = 10 {
    willSet{
        print("willSet")
    }
    didSet{
        print("didSet")
    }
}

//下标
struct TimesOfNum {
    let num:Int
    let otherNum:Int
    
    subscript(index: Int) -> Int {
        return num * index
    }
    subscript(index1:Int, index2:Int) -> Int {
        return num * index1 + index2
    }
}

let TimesOfFive = TimesOfNum(num: 5, otherNum: 3)
print("5的3倍是\(TimesOfFive[3])")
print("5的3倍再加3是\(TimesOfFive[3,3])")

//类 继承
class Transport {
    var scope:String
    init(scope:String) {
        self.scope = scope
    }
}

class Car:Transport {
    var type:String = "大巴"
    init(scope:String, type:String) {
        super.init(scope: scope)
        self.type = type
    }
}

class Airplane:Transport {
    var company:String = "飞机"
    init(scope:String, company:String) {
        super.init(scope: scope)
        self.company = company
    }
}

//class Car:Transport {
//    final var wheel = "普利司通"    //加了final后不能被继承，可以修饰类，使得整个类不能被继承
//    override var scope: String {
//        didSet {
//            print("领域改变了")
//        }
//    }
//
//    override func move() {
//        print("汽车在移动")
//    }
//    func superMove() {
//        super.move()
//    }
//}
//var myCar = Car()
//myCar.scope = "陆地"
//myCar.move()
//myCar.superMove()

//允许失败的构造器
let image = UIImage(named:"test")


//类型嵌套(数据结构嵌套使用)
//校服结构
struct SchoolUniform {
    enum Style:String {
        case Sports = "运动服", Suit = "中山装"
    }
    enum Grade:String {
        case One = "初一", Tow = "初二", Three = "初三"
    }
    let myStyle:Style
    let myGrade:Grade
    func customize() {
        print("我的年级\(myGrade.rawValue) 我的款式\(myStyle.rawValue)")
    }
}

let uniform4XiaoMing = SchoolUniform(myStyle: .Suit, myGrade: .One)
uniform4XiaoMing.customize()
































