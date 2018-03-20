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
func show<T>(para: T) {
    print("Hello \(para)")
}
show(para: "小明")
show(para: 12)

//可以要求节点遵循某种协议
//public func ==<Element : Equatable>(lhs: [Element], rhs: [Element]) -> Bool
//用where可以进一步对节点进行约束
func anyCommonElements <T:Sequence, U:Sequence>(lhs: T, _ rhs: U) -> Bool where T.Iterator.Element:Equatable, T.Iterator.Element == U.Iterator.Element {
    return true
}

//泛型协议  关键字 associatedtype
protocol SomeProtocol {
    associatedtype Element
    func elementMethod1(element:Element)
    func elementMethod2(element:Element)
}



























