//: [Previous](@previous)

import Cocoa

var bucketlist = ["Climb Mt. Everst"]
var newItems = [
               "Fly hot air balloon to Fiji",
               "Watch Lord of the Rings trilogy in one day",
               "Go on a walkabout",
               "Scuba Dive in the great blue hole",
               "Find a tripple rainbow",
               ]
bucketlist += newItems
bucketlist
bucketlist.remove(at: 2)
print(bucketlist.count)
print(bucketlist[0...2])
bucketlist[2] += " in Australia"
bucketlist[0] = "Climb Mt. Kilimanjaro"
bucketlist.insert("Toboggan across Alaska", at: 2)
bucketlist

var myronsList = [
                 "Climb Mt. Kilimanjaro",
                 "Fly hot air balloon to Fiji",
                 "Toboggan across Alaska",
                 "Go on a walkabout in Australia",
                 "Scuba Dive in the great blue hole",
                 "Find a tripple rainbow",
                 ]

let equal = bucketlist == myronsList

let lunches =   [
                 "Cheeseburger",
                 "Veggie Pizza",
                 "Chicken Cesear Salad",
                 "Black Bean Burrito",
                 "Falafel Wrap",
                ]


//:  Bronze Challenge
var todoList =  [
                 "Take out garbage",
                 "Pay bills",
                 "Cross off finished items",
                ]

let emptiness = todoList.isEmpty  // use the isEmpty property to check if an Array is empty

//: Silver Challenge
var reversedTodoList = todoList

for (index, item) in todoList.enumerated() {
    reversedTodoList[index] = todoList[todoList.count - 1 - index] //reversing list order
}
todoList
reversedTodoList

// much simpler
var reversedTodoList2 = todoList.reversed()
todoList
reversedTodoList2


//: Gold Challenge
bucketlist
let balloonsIndex = bucketlist.index(of: "Fly hot air balloon to Fiji")

let twoDown: (i: Array<Any>.Index ,text: String)

if let index = balloonsIndex {
    twoDown.i = bucketlist.index(index, offsetBy: 2)
    twoDown.text = bucketlist[twoDown.i]
} else {
    print("Item not found")
}


//: [Next](@next)
