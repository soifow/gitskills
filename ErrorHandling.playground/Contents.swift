//: Playground - noun: a place where people can play

import UIKit

enum Token {
    case number(Int)
    case plus
    case minus
}

class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Character)
    }
    
    let input: String
    var position: String.Index
    
    init(input: String) {
        self.input = input
        self.position = input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nexCharacter = peek() {
            switch nexCharacter {
            case "0" ... "9":
                let digitValue = Int(String(nexCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                return value
            }
        }
        
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case "-":
                tokens.append(.minus)
                advance()
            case " ":
                advance()
            default:
                throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
        
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus:
            fallthrough
        case .minus:
            throw Parser.Error.invalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber() //数字开头
        
        while let token = getNextToken() {
            switch token {
            case .plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .number:
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
}


func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer ouput: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
        
    } catch Lexer.Error.invalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    }
    catch {
        print("An eooro occurred: \(error)")
    }
}

evaluate("10 + 3 + 5")
evaluate("10 + 5 - 3 - 1")





