//: Playground - noun: a place where people can play

import UIKit


class Foo {
    lazy var hi: Date! = { Date() }()
}
let thing = Foo()

let wasteTime = { for i in 1...Int(1E4) { let j = i + 5 } }

let begin = Date()

let first = -begin.timeIntervalSince(thing.hi)
print("first: \(first)")
wasteTime()
let second = -begin.timeIntervalSince(thing.hi)
print("secon: \(second)")
thing.hi = nil
print("set nil")
wasteTime()
let third = -begin.timeIntervalSince(thing.hi)
print("third: \(third)")
thing.hi = Date(timeIntervalSince1970: 0)
print("set 1970")
let fourth = -begin.timeIntervalSince(thing.hi)
print("fourth: \(fourth)")
thing.hi = nil
print("set nil")
wasteTime()
let fifth = -begin.timeIntervalSince(thing.hi)
print("fifth: \(fifth)")