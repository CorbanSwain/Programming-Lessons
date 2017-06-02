//: [Previous](@previous)

//: Chapter 6: Loops

import Cocoa

var myFirstInt: Int = 0

for _ in 1...5 {
    myFirstInt += 1
    myFirstInt
    print(myFirstInt)
}

for i in 1...100 where i % 3 == 0 {
    print(i, terminator: ", ")
}

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

var sheilds = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while sheilds > 0 {
    
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    
    if blastersOverheating {
        print("Blasters are Overheated! Cooldown initiated.")
        // sleep(5)
        print("Blasters are ready to fire")
        // sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    // Fire blasters!
    print("Fire Blasters!")
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}


// Silver Challenge

print("\n\n\nIF-BASED FIZZ-BUZZ")

let start = 0
let end = 100
var outputText: String?

for i in start...end {
    if i % 3 == 0 {
        outputText = "FIZZ"
    }
    if i % 5 == 0 {
        outputText = (outputText ?? "") + "BUZZ"
    }
    
    print(outputText ?? i)
    outputText = nil
}


print("\n\n\nSWITCH-BASED FIZZ-BUZZ")
var outputText2: String = ""
var severalRemainders = (mod3: 0, mod5: 0)

for i in start...end {
    severalRemainders.mod3 = i % 3
    severalRemainders.mod5 = i % 5
    
    switch severalRemainders {
    case (0,0):
        outputText2 = "FIZZ BUZZ"
    case (0,_):
        outputText2 = "FIZZ"
    case (_,0):
        outputText2 = "BUZZ"
    default:
        outputText2 = String(i)
    }
    
    print(outputText2)
}


//: [Next](@next)
