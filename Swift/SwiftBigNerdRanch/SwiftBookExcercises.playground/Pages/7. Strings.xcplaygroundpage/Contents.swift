//: [Previous](@previous)

import Cocoa

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print("'\(c)'", terminator: ", ")
}
print("\n")

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

let aAcutePrecomposed = "\u{00E1}"

let b = (aAcute == aAcutePrecomposed) // true
print("aAcute: \(aAcute.characters.count) ; aAcutePrecomposed: \(aAcutePrecomposed.characters.count)")

let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharachter = playground[end]
let range = start...end
let firstFive = playground[range]

//: Bronze Challenge
let empty = ""
let start2 = empty.startIndex
let end2 = empty.endIndex

if start2 == end2 {
    print("It's empty!")
}

if empty.isEmpty { // Much simpler
    print("It's empty!")
}

//: Silver Challenge

let hello = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"


//: [Next](@next)
