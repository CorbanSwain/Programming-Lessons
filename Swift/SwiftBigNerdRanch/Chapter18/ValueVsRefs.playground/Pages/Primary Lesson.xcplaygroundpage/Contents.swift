//: Playground - noun: a place where people can play
// Chapter 18 Value vs Reference Types
// "Swift Programming: The Big Nerd Ranch Guide" 2nd Edition

import Cocoa

var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today?"
str

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}
let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

anotherHecate.name = "AnotherHecate"
hecate.name

struct Pantheon {
    var cheifGod: GreekGod
}

let pantheon = Pantheon(cheifGod: hecate)
let zeus = GreekGod(name: "Zeus")
zeus.name = "Zeus Jr."
zeus.name

pantheon.cheifGod.name // "AnotherHecate"
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.cheifGod.name // ???
pantheon.cheifGod.name
// Complications of placing a reference type (GreekGod) within a value type (Pantheon)

let athena = GreekGod(name: "Athena")

let gods = [athena, hecate, zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy