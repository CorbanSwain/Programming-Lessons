//: [Previous](@previous)

import Cocoa


enum TextAlignment: Int {
    case left       = 20
    case right      = 30
    case center     = 40
    case justify    = 50
}

var alignment = TextAlignment.justify

print("Left has raw value \(TextAlignment.left.rawValue)")
print("Right has raw value \(TextAlignment.right.rawValue)")
print("Center has raw value \(TextAlignment.center.rawValue)")
print("Justify has raw value \(TextAlignment.justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")

// Create a raw value
let myRawValue = 25

//Try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    // Conversion Succeded!
    print("Succesfully converted \(myRawValue) into the TextAlignment, \(myAlignment).")
} else {
    // Conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case.")
}

if alignment == .right {
    print("We should right-align the text.")
}

switch alignment {
case .left:
    print("left aligned")
    
case .right:
    print("right aligned")
    
case .center:
    print("center aligned")
    
case .justify:
    print("justified")
}


enum ProgrammingLanguage: String {
    case swift
    case objectiveC = "objective-c"
    case c
    case cpp        = "c++"
    case java
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

enum Lightbulb {
    case on(toggleTime: NSDate)
    case off(toggleTime: NSDate)
    
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        /// Gives temp of a given lightbulb
        let hotTempDiff = 150.0
        
        switch self {
        case .on:
            return ambient + hotTempDiff
            
        case .off:
            return ambient + findDeltaTemp(fromOriginalDeltaTemp: hotTempDiff,
                                           atDeltaTime: self.timeSinceLastToggle())
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off(toggleTime: NSDate())
            
        case .off:
            self = .on(toggleTime: NSDate())
        }
    }
    
    func findDeltaTemp(fromOriginalDeltaTemp deltaTemp: Double,
                       atDeltaTime deltaTime: TimeInterval) -> Double {
        
        let m = 0.050 // mass of lightbulb in kg
        let cp = 840.0 // heat capacity of glass in J/(kg K)
        let surfArea = 0.012 // surface area of a lightbulb in m^2
        let h = 1 / 8e-3 // heat transfer coeff of glass in (W / (m^2 K))
        
        let tau = m * cp / (surfArea * h) // calculating time constant
        
        if (5 * tau) < abs(deltaTime) { // if the current time is more then 5 time constants from toggle...
            return 0 // ...assume the temp difference is now zero
        } else {
            return round(10 * deltaTemp * exp(deltaTime / tau)) / 10
        }
    }
    
    func timeSinceLastToggle() -> TimeInterval {
        switch self {
        case let .on(toggleTime: time):
            return time.timeIntervalSinceNow
            
        case let .off(toggleTime: time):
            return time.timeIntervalSinceNow
        }
    }
}

var bulb = Lightbulb.on(toggleTime: NSDate())
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
//sleep(5)
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")


//: Assosiated Values

enum ShapeDimensions {
    // point has no associated value - it is dimensionless
    case point
    
    //square's assosiated va;ua is the length of onw side
    case square(side: Double)
    
    // rectangle's assosiated value defines its width and height
    case rectangle(width: Double, height: Double)
    
    // triangle's assiated value defines the lengths of its three sides
    case triangle(leg: Double, leg: Double, hyp: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        
        case let .square(side: side):
            return side * side
            
        case let .rectangle(width: w, height: h):
            return w * h
            
        case let .triangle(leg: a, leg: b, hyp: _):
            return a * b / 2
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
            
        case let .rectangle(width: w, height: h):
            return (2 * w) + (2 * h)
            
        case let .square(side: s):
            return 4 * s
            
        case let .triangle(leg: a, leg: b, hyp: c):
            return a + b + c
        }
    }
}

func triangleBuilder(leg1: Double, leg2: Double) -> ShapeDimensions {
    
    let hyp = sqrt((leg1 * leg1) + (leg2 * leg2))
    return ShapeDimensions.triangle(leg: leg1, leg: leg2, hyp: hyp)
}


var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")



//: Recursive Enumerations
enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(
        fathersName: String, fatherAncestors: FamilyTree,
        motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(
    fathersName: "Fred Sr.",
    fatherAncestors: .oneKnownParent(name: "Beth",
                                     ancestors: .noKnownParents),
    motherName: "Marsha",
    motherAncestors: .noKnownParents)

// Bronze Challenge
print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")

// Silver Challenge
let myRightTriangle = triangleBuilder(leg1: 30, leg2: 40)
print("my triangle's area = \(myRightTriangle.area())")
print("my triangle's perimeter = \(myRightTriangle.perimeter())")

//: [Next](@next)
