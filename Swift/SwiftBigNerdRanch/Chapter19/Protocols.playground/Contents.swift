//: Playground - noun: a place where people can play

import Cocoa

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    
    // Create first row containing column headers
    var firstRow = "|"
    
    //Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        columnWidths.append(columnLabel.characters.count)
        for j in 0 ..< dataSource.numberOfRows {
            let item = dataSource.itemFor(row: j, column: i)
            if item.characters.count > columnWidths[i] {
                columnWidths[i] = item.characters.count
            }
        }
        let paddingNeeded = columnWidths[i] - columnLabel.characters.count
        let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
        let columnHeader = " \(padding)\(columnLabel) |"
        firstRow += columnHeader
        
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Start the output string
        var out = "|"
        
        // Append each item in this row to the string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidths[j] - item.characters.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        // Done - print it!
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
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
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid Column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid Column")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Corban Nathanael Swain", age: 1000, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))
printTable(department)


struct BookCollection: TabularDataSource, CustomStringConvertible {
    let owner: String
    var books = [Book]()
    
    init(owner: String) {
        self.owner = owner
    }
    
    mutating func add(_ book: Book...) {
        books.append(contentsOf: book)
    }
    
    mutating func add(_ books: [Book]) {
        self.books.append(contentsOf: books)
    }
    
    // Mark: CustomStringConvertible Conformance
    
    var description: String {
        return "\(owner)'s Book Collection"
    }
    
    // Mark: TabularDataSource Conformance
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Book Title"
        case 1: return "Author"
        case 2: return "Rating"
        default: fatalError("Invalid Column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.title
        case 1: return book.author
        case 2:
            let formatter = NumberFormatter()
            formatter.maximumSignificantDigits = 2
            formatter.minimumSignificantDigits = 2
            return (formatter.string(from: book.averageReview as NSNumber) ?? "??") + "/5"
        default: fatalError("Invalid Column!")
        }
    }
}

struct Book {
    var title: String
    var author: String
    var averageReview: Double
}

let citiesBook = Book(title: "A Tale of Two Cities", author: "Charles Dickens", averageReview: 4.2)
let swiftBook = Book(title: "Swift Programming: The Big Nerd Ranch Guide (2nd Edition)", author: " Matthew Mathias", averageReview: 4.7)
let lifeBook = Book(title: "A Life Well Lived: A Study of the Book of Ecclesiastes", author: "Tommy Nelson", averageReview: 4.6)

var bookCollection = BookCollection(owner: "Corban Swain")
bookCollection.add(citiesBook, swiftBook, lifeBook)
printTable(bookCollection)

