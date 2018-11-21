//: Playground - noun: a place where people can play

import UIKit

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource) {
    var firstRow = "|"
    var columnWidths = [Int]()
    
    //根据列名初始化列宽度
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        columnWidths.append(columnLabel.count)
    }
    
    //扫描数据最终确定列宽
    for i in 0 ..< dataSource.numberOfRows {
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            if columnWidths[j] >= item.count {
                //do nothing.
            } else {
                columnWidths[j] = item.count    //  重新制定列宽
            }
        }
    }
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        if columnWidths[i] >= columnLabel.count {   //列宽大于标题时
            let paddingNeeded = columnWidths[i] - columnLabel.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            firstRow += " \(padding)\(columnLabel) |"
        } else {
            firstRow += " \(columnLabel) |"
        }
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        var out = "|"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            if columnWidths[j] >= item.count {
                let paddingNeeded = columnWidths[j] - item.count
                let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
                out += " \(padding)\(item) |"
            } else {
                out += " \(item) |"
            }
        }
        
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0:
            return "Employee Name"
        case 1:
            return "Age"
        case 2:
            return "Years of Experience"
        default:
            fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0:
            return person.name
        case 1:
            return String(person.age)
        case 2:
            return String(person.yearsOfExperience)
        default:
            fatalError("Invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))
printTable(department)


struct Book {
    var name: String
    var author: String
    var score: Double
}


struct BookCollection: TabularDataSource {
    var books = [Book]()
    
    mutating func addBookToList(_ book: Book) {
        books.append(book)
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0:
            return "Book Name"
        case 1:
            return "Author Name"
        case 2:
            return "Score of Amazon"
        default:
            fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0:
            return book.name
        case 1:
            return book.author
        case 2:
            return String(book.score)
        default:
            fatalError("Invalid column!")
        }
    }
}

var bookList = BookCollection()
bookList.addBookToList(Book(name: "The test book name 1", author: "JZ.", score: 3.2))
bookList.addBookToList(Book(name: "The test book name 2", author: "JZ.", score: 3.2))
bookList.addBookToList(Book(name: "The test book name 3", author: "JZ.", score: 3.2))
bookList.addBookToList(Book(name: "The test book name 4", author: "JZ.", score: 3.2))
printTable(bookList)
