//: Playground - noun: a place where people can play

import UIKit

//声明协议
/*
protocol 协议:继承的协议1,继承的协议2 {
    var 某个属性:类型{set, get}   //指明读写权限
    func 某个方法(参数列表)->返回值类型
    init 构造器(参数列表)
}
 */

protocol someProtocol {
    var num:Int{get}
}
class show: someProtocol {
    var so = 1
    var num:Int{
        get{
            return so
        }
        //实现协议时为只读属性设置setter方法也不会报错
        set{
            so = newValue + 1
        }
    }
}
var show1 = show()
show1.num = 5
print(show1.so)

//==============================================
//类遵守协议，把协议放在父类之后 class 某类:父类,协议1,协议2,协议3... {}
//如果多个协议总是一起出现，可以使用typealias给多个协议起一个别名
/*
 typealias 协议组合别名 = 协议1 & 协议2
 class 某个类:父类,协议组合别名{}
 struct 某个结构体:协议组合别名{}
 */

//
//class SomeViewController : UIViewController, UICollectionViewDelegate {
//    //不得不把delegate中的方法实现卸载类的定义中，与控制器中的数据处理、逻辑控制等代码混在一起，很难维护
//}
//
//extension SomeViewController: UICollectionViewDelegate {
//    //这部分代码块只有delegate中的方法，代码更加整洁
//}
//

//==============================================
//实现扩展
//定义两个协议Coder , Swifter
protocol Coder {
    func question()
    func answer()
}
protocol Swifter {
    var codingLevel:Int{get set}
}
//extension Coder where Self:Swifter {
//    func question() {
//        print("编程技术谁最强")
//    }
//    func answer() {
//        print("iOS于世民")
//    }
//}

//三个程序员
struct CoderFromA:Coder {
    func question() {
        print("...")
    }
    func answer() {
        print("...")
    }
}
struct CoderFromB:Coder,Swifter {
//    func question() {
//        print("编程技术谁最强")
//    }
//    func answer() {
//        print("iOS于世民")
//    }
    var codingLevel = 3
}
struct CoderFromC:Coder,Swifter {
//    func question() {
//        print("编程技术谁最强")
//    }
//    func answer() {
//        print("iOS于世民")
//    }
    var codingLevel = 5
}

//Swift程序员都提问和回答都一样，因此B和C存在冗余的部分，这是由于不同协议的Swifter与Coder间的因果关系引起的，但是规则的关系不得不重复地去实现question()和answer()

//使用协议扩展
extension Coder where Self:Swifter {
    func question() {
        print("编程技术谁最强")
    }
    func answer() {
        print("iOS于世民")
    }
}

//where的作用是限定协议扩展有效的条件，在where语句中可以使用Self关键字代表协议的遵守者，可以指定 遵守者是某类的子类或遵守了某个协议
//上面限定Coder的遵守者在同时遵守Swifter协议时可以获得本次扩展中的默认实现
//现在某数据结构同时遵守Coder和Swifter时，question()和answer()会有默认实现

let CoderA = CoderFromB()
CoderA.question()
CoderA.answer()

//==============================================
//特殊的协议，定义的方法是操作符形式的，作用域是全局的，遵守这样的协议需要重载全局的操作符，比如Equatable，要求遵守者重载==操作符
//比如要比较结构体相等（对Int封装）
struct BoxInt {
    var intValue:Int
}
//全局重载==
func ==(lhs:BoxInt, rhs:BoxInt) -> Bool {
    return lhs.intValue == rhs.intValue
}

//如果想判!=，还得重载!=，很麻烦
//对于相关联的操作符，不如 ==和!=, >和<，重载每一个操作符效率很低，此时可以通过协议扩展解决该问题
//func !=(lhs:BoxInt, rhs:BoxInt) -> Bool {
//    return lhs.intValue != rhs.intValue
//}

let b1 = BoxInt(intValue:1)
let b2 = BoxInt(intValue:2)
extension BoxInt:Equatable {}  //查看Equatable的实现，底层库对!=有默认实现，因此虽然只重载了==，!=依然可用
print(b1 == b2)
print(b1 != b2)   //不等号没重载会报错


//扩展协议的静态特性
//==============================================
//协议扩展补充 (扩展协议中，除了赋上默认实现外，还能定义新的方法并赋上默认实现)
protocol SharedString {
    //step5 清空SharedString，让俩方法都变为扩展协议中的方法，分别看两种上下文的输出
//    func methodForOverride()
    //step4 让methodWithoutOverride()变成扩展协议中新增的方法，分别看两种上下文的输出
//    func methodWithoutOverride()
}
//协议扩展，给定默认实现
extension SharedString {
    func methodForOverride() {
        print("Σ( ° △ °|||)︴")
    }
    func methodWithoutOverride(){
        print("------")
        methodForOverride()
        print("------")
    }
}
//遵守协议
extension String:SharedString {
    //重写协议扩展中的方法，methodWithoutOverride()虽然未被重写，但调用的是重写后的方法，输出也跟着变了
    //step 2
    func methodForOverride() {
        print(self)
    }
}
//类型推断"hehe"为String，遵循所有扩展协议
//"hello".methodForOverride()         //step5时，此方法调用的是重写后的版本
//"hello".methodWithoutOverride()     //step5时，此方法调用扩展协议中的默认版本

//step3 修改上下文（协议本身也可以作为一种类型）
let hello:SharedString = "hello"
hello.methodForOverride()         //step5时，由于上下文，俩方法都是默认版本
hello.methodWithoutOverride()

//==============================================
//协议的继承
protocol SearchIntArrayMax {
    
}
//指定当SearchIntArrayMax协议的遵守者同时遵守Collection协议，且元素类型为Int时可以调用showMax方法
extension SearchIntArrayMax where Self:Collection, Self.Iterator.Element == Int {
    func showMax() -> String {
        if let max = self.max() {   //使用Collection协议中的max()方法返回值(可选型)
            return "\(max)"
        }
        return "无最大值"
    }
}

//让标准库中的Array遵循该协议
extension Array:SearchIntArrayMax {}

//Step2.重新定义一个协议
//protocol CanCompareMax{
//
//}
////比较两个数组的最大值(都存在最大值时才可用，否则输出 无最大值; 最大值相等时输出最大值，否则输出 不相等)
//extension CanCompareMax where Self:Collection, Self.Iterator.Element == Int {
//    func compareMax(other:Self) -> String {
//        guard let selfMax = self.max(), let otherMax = other.max() else {
//            return "无最大值"
//        }
//
//        return selfMax == otherMax ? "\(selfMax)" : "不相等"
//    }
//}

//Step3.观察两个协议，在获取最大值这个需求上是一样的，但由于功能描述不同，上面做了2个封装，彼此无法共享代码
////解决：CanCompareMax协议继承SearchIntArrayMax协议
protocol CanCompareMax:SearchIntArrayMax {

}

extension CanCompareMax where Self:Collection, Self.Iterator.Element == Int {
    func compareMax(other:Self) -> String {
        switch (self.showMax(), other.showMax()) {
        case ("无最大值",_):fallthrough
        case (_,"无最大值"):return "无最大值"
        case let (a,b) where a == b : return a
        default:
            return "不相等"
        }
    }
}

//测试
[2,3,1].showMax()
[].showMax()
//不符合扩展协议要求，无法调用showMax()
//["3","2","1"].showMax()

extension Array:CanCompareMax{}
[1,2,3].compareMax(other: [1,1,1])
[1,2,3].compareMax(other: [3,1,1])
[1,2,3].compareMax(other: [])















