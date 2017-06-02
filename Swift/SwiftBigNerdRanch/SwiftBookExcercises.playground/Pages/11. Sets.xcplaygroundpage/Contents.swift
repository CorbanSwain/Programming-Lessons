//: [Previous](@previous)

import Cocoa

var groceryBag: Set = ["Apples", "Oranges", "Pinapples"]

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")
let friendsGroceryBag = Set(["Bananas","Cereal","Milk","Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roomatesGroceryBag = Set(["Apples","Bananas","Cereal","Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roomatesGroceryBag)

let yourSecondBag = Set(["Berries","Yogurt"])
let roomatesSecondBag = Set(["Grapes","Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roomatesSecondBag)

// Bronze Challenge
let myCities: Set = ["Atlanta","Chicago","Jacksonville","New York","San Francisco"]
let yourCities: Set = ["Chicago","San Francisco","Jacksonville"]
let trulySuperset = myCities.isSuperset(of: yourCities)

// Silver Challenge
var groceryBag2: Set = ["Apples", "Oranges", "Pinapples"]
groceryBag2.formUnion(friendsGroceryBag);
groceryBag2

var roomatesGroceryBag2 = Set(["Apples","Bananas","Cereal","Toothpaste"])
roomatesGroceryBag2.formIntersection(groceryBag2)
roomatesGroceryBag2




//: [Next](@next)
