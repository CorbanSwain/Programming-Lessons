//: [Previous](@previous)

import Cocoa

var str = "Hello, playground"

var population: Int = 60422
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town!"
} else {
    message = "\(population) is a big town!"
}
print(message)

if !hasPostOffice {
    print("Where do I buy stamps?")
}

//: [Next](@next)
