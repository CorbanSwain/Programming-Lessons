//: [Previous](@previous)

import Cocoa

var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?
if let theError = errorCodeString,
   let errorCodeInteger = Int(theError),
   errorCodeInteger == 404 {
        errorDescription = "\(errorCodeInteger + 200): resource was not found"
}

var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription

upCaseErrorDescription?.append(" PLEASE TRY AGAIN")
upCaseErrorDescription

let description = errorDescription ?? "No error"

errorDescription = nil
let description2 = errorDescription ?? "No error"


// Bronze Challenge
// Number of kids should be Int, 0 kids is better than nil, no literal difference between the two
// Pet name should be String?, there could be a pet with no name, "", which would be different from no pet at all, nil.


// Silver Challenge

let nilTest: String? = nil
//let badUnwrap = nilTest!

//: [Next](@next)
