//: Playground - noun: a place where people can play

import UIKit

protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Element?
}

struct StackIterator<T>: IteratorProtocol {
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    func makeIterator() -> Iterator
}


struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map { 2 * $0 }

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

print(doubledStack.pop())
print(doubledStack.pop())

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())

//给定T类型数组，返回U类型数组
func myMap<T,U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var result = [U]()
    //对T数组的所有元素遍历
    for item in items {
        result.append(f(item))  //经过f函数总能得到一个U，将U放入result
    }
    
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.count }
print(stringLengths)


func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a diff string"))








