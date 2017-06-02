//: [Previous](@previous)

import Cocoa

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greet(name: "Matt", withGreeting: "Hello,")
print(personalGreeting)

func greeting(_ greeting: String) -> ( (String) -> String ) {
    
    return { "\(greeting) \($0)" }
}

let friendlyGreetingFor = greeting("Hello,")
let mattGreeting = friendlyGreetingFor("Matt")
print(mattGreeting)

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}


var p = Person()
let changeName = Person.changeTo
let changeNameFromMattTo = changeName(&p)
changeNameFromMattTo("John", "Gallagher")
p.firstName

// Much Simpler
var p2 = Person()
p2.changeTo(firstName: "John", lastName: "Gallagher")
p2.firstName

//: [Next](@next)
