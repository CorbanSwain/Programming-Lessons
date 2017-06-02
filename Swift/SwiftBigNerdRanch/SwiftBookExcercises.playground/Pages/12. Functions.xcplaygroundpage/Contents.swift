//: [Previous](@previous)

import Cocoa



/* printGreeting function ************************************************/

func printGreeting() -> Void {
    print("Hello, playground")
}
printGreeting()


/* printPersonalGreeting function ************************************************/

func printPersonalGreeting(to names: String...) {
    for name in names {
        print("Hello \(name), welcome to your playground")
    }
}
printPersonalGreeting(to: "Alex","Chris","Drew","Pat")



/* divisionDescriptionFor function ************************************************/

func divisionDescriptionFor(numerator:          Double,
                            denominator:        Double,
                            withPunctuation:    String = ".")
    -> String
{
    return ("\(numerator) divided by \(denominator) " +
        "equals \(numerator / denominator)\(withPunctuation)")
}

print(divisionDescriptionFor(numerator: 9.0,
                             denominator: 3.0,
                             withPunctuation: "!"))



/* appendErrorCode function ************************************************/

var error = "The request failed:"
var error2 = "Its no good."
func appendErrorCode(_ code: Int,
                     toErrorString errorString: inout String,
                     toErrorMessage errorMessage: inout String) {
    if code == 400 {
        errorString += " bad request."
        errorMessage = "Very bad request!"
    }
}
appendErrorCode(400, toErrorString: &error, toErrorMessage: &error2)
error
error2



/* areaOfTriangleWith function ************************************************/

func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return(divide())
}
areaOfTriangleWith(base: 3.0, height: 5.0)



/* sortedEvenOddNumbers function ************************************************/

func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int])
{
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers
    {
        if number % 2 == 0
        {
            evens.append(number)
        }
        else
        {
            odds.append(number)
        }
    }
    return (evens, odds)
}
let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens)\n" +
    "The odd numbers are: \(theSortedNumbers.odds)")



/* grabMiddleName function ************************************************/

func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt",nil,"Mathias"))
if let theName = middleName {
    print(theName)
}



/* greetByMiddleName function ************************************************/

func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Matt","Danger","Mathias"))

// Bronze Challenge

func greetByMiddleName2(fromFullName name: (first: String,
    middle: String?,
    last: String))
{
    guard let   middleName = name.middle,
        middleName.characters.count >= 4 else
    {
        print("Hey there!")
        return
    }
    
    print("Hey \(middleName)")
}
greetByMiddleName2(fromFullName: ("Matt","D.","Mathias"))

// Silver Challenge

func siftBeans(fromGroceryList list: [String],
               onlyCheckingSuffix: Bool = true) -> (beans: [String], otherGroceries: [String]) {
    
    var beans: [String] = [], others: [String] = []
    let checkForBeans: (_ within: String) -> Bool
    
    if onlyCheckingSuffix {
        checkForBeans = { $0.lowercased().hasSuffix("beans") }
    } else {
        checkForBeans = { $0.lowercased().contains("beans") }
    }
    
    for item in list {
        if checkForBeans(item) {
            beans.append(item)
        } else {
            others.append(item)
        }
    }
    return (beans,others)
}

let beanSortedList = siftBeans(fromGroceryList: ["Green Beans",
                                                 "milk",
                                                 "black beans",
                                                 "pinto beans",
                                                 "apples",
                                                 "Red Beans and Rice"],
                               onlyCheckingSuffix: false)

// Define '+=' for types String and Int

func +=(lhs: inout String, rhs: Int) {
    lhs = "\(lhs): \(rhs)"
}

var testStr = "Cool"
testStr += 8
print(testStr)

//: [Next](@next)
