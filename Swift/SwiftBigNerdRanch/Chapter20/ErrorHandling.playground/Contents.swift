//: Playground - noun: a place where people can play

import Cocoa

typealias Index = Int

enum Token: CustomStringConvertible {
    case number(Int)
    case operation(Operation)
    
    var description: String {
        switch self {
        case .number(let i):
            return ".number(\(i))"
        case .operation(let o):
            return String(describing: o)
        }
    }
}

enum Operation: CustomStringConvertible {
    case plus
    case minus
    case times
    case dividedBy
    
    var description: String {
        switch self {
        case .plus: return ".plus"
        case .minus: return ".minus"
        case .times: return ".times"
        case .dividedBy: return ".dividedBy"
        }
    }
    
    var presecedence: Int {
        switch self {
        case .plus, .minus: return 0
        case .times, .dividedBy: return 1
        }
    }
    
    init?(fromChar c: Character) {
        switch c {
        case "+": self = .plus
        case "-": self = .minus
        case "*": self = .times
        case "/": self = .dividedBy
        default: return nil
        }
    }
    
    func perform(on x: Int, with y: Int) -> Int {
        switch self {
        case .plus: return x + y
        case .minus: return x - y
        case .times: return x * y
        case .dividedBy: return x / y
        }
    }
}

class Lexer {
    enum Error: Swift.Error, CustomStringConvertible {
        case invalidCharachter(Character, Index)
        
        var description: String {
            switch self {
            case .invalidCharachter(let (c, i)):
                return "Input contained an invalid charachter, \'\(c)\', at index \(i)."
            }
        }
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
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
        
        while let nextCharachter = peek() {
            switch nextCharachter {
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharachter))!
                value = 10 * value + digitValue
                advance()
                
            default:
                // A nondigit - go back to regular lexing
                return value
            }
        }
        
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharachter = peek() {
            switch nextCharachter {
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.number(value))
                
            case " ":
                // Just advance to ignore spaces
                advance()
                
            default:
                
                if let operation = Operation(fromChar: nextCharachter) {
                    tokens.append(.operation(operation))
                    advance()
                } else {
                    let distanceToPosition = input.distance(from: input.startIndex, to: position)
                    throw Lexer.Error.invalidCharachter(nextCharachter, distanceToPosition)
                }
            }
        }
        
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error, CustomStringConvertible {
        case unexpectedEndOfInput
        case invalidToken(Token, Index)
        
        var description: String {
            switch self {
            case .unexpectedEndOfInput:
                return "Unexpected end of input during parsing."
            case .invalidToken(let (t, i)):
                return "Invalid token, \(t), found at position \(i) during parsing."
            }
        }
    }
    
    let tokens: [Token]
    var position = 0
    var maxPresedence = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
        for token in tokens {
            switch token {
            case .operation(let o):
                if o.presecedence > maxPresedence {
                    maxPresedence = o.presecedence
                }
            default:
                break
            }
        }
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
        default:
            throw Parser.Error.invalidToken(token, position - 1)
        }
    }
    
    func parse() throws -> Int {
        //Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
                
            case .operation(let o):
                guard o.presecedence <= maxPresedence else {
                    fatalError("FATAL ERROR! maxPresedence has been incorrecly calculated.")
                }
                if o.presecedence == maxPresedence {
                    let nextNumber = try getNumber()
                    value = o.perform(on: value, with: nextNumber)
                } else {
                    var remainingTokens = [Token]()
                    while let token = getNextToken() {
                        remainingTokens.append(token)
                    }
                    let subParser = Parser(tokens: remainingTokens)
                    value = o.perform(on: value, with: try subParser.parse())
                }
                
            // Getting a number after a number is not legal
            case .number:
                throw Parser.Error.invalidToken(token, position - 1)
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
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch {
        print("ERROR! ... \(error)")
    }
}

evaluate("5 / 5 * 3 + 7")
print(5 / 5 * 3 + 7)


