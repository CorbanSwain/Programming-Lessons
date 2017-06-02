//: [Previous](@previous)

import Cocoa

var movieRatings =  [
                     "Donnie Darko":        4,
                     "Chungking Express":   5,
                     "Dark City":           4,
                    ]
print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating,
   let currentRating = movieRatings["Donnie Darko"]
{
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}
movieRatings["The Cabinet of Dr. Caligari"] = 5
movieRatings["Dark City"] = nil
for (key,value) in movieRatings {
    print("The movie, \"\(key),\" was rated \(value)")
}
for movie in movieRatings.keys {
    print("User has rated \(movie)")
}
let watchedMovies = Array(movieRatings.keys)
let album = [
             "Diet Roast Beef":                     268,
             "Dubba Dubbs Stubs His Toe":           467,
             "Smokey's Carpet Cleaning Service":    187,
             "Track 4":                             221,
            ]

// Silver Challenge

let georgiaCounties =   [
                         "Macon":   [22345,23654,26666,85966,23654],
                         "Swanee":  [33222,42322,11230,44321,44366],
                         "Wershire":[66598,45652,88962,12325,44425],
                        ]
var georgiaCodes: [Int] = []
for codes in georgiaCounties.values {
    georgiaCodes += codes
}
print(georgiaCodes)

// Gold Challenge

let introMessage = "The zipcodes in GA are: [ "
var introSpaces = ""
for _ in introMessage.characters {
    introSpaces += " "
}
let zipsPerLine = 5
var term = ""
print(introMessage, terminator: term)

for (i, zipCode) in georgiaCodes.enumerated() {
    
    if ((i + 1) == georgiaCodes.count) {
        term = " ]\n"
        
    } else if (((i + 1) % zipsPerLine) == 0 ) {
        term = "\n"
        
    } else {
        term = ", "
    }
    
    print(zipCode, terminator: term)
    
    if term == "\n" {
        print(introSpaces, terminator: "")
    }
}



//: [Next](@next)
