//: Playground - noun: a place where people can play

import UIKit

//variables swap in one line, without extra variables

func swap<T>(a: inout T, with b: inout T) {
    (a, b) = (b, a)
}

var a = 4
var b = 5

swap(a: &a, with: &b)

[a, b]

//flex strings

func flexStrings(s1: String = "", s2: String = "") -> String {
    return s1 + s2 == "" ? "none" : s1 + s2
}

flexStrings()

//sum any

func sumAny(_ input: Any...) -> String {
    return String((input.map { (item) -> Int in
        switch item {
        case "" as String, 0 as Int:
            return -10
        case let x as String:
            guard let int = Int(x) else { return 0 }
            return int
        case is Int:
            return item as! Int
        default:
            return 0
        }
        } as [Int]).reduce(0) { (x, y) -> Int in
            x + y
    })
}

sumAny("asd", 0, 50, 0, "", "12")

//count from begin to end without loops

func count(from: Int, to: Int) {
    print(from)
    if(from <= to) {
        count(from: from + 1, to: to)
    }
}

count(from: 1, to: 5)

//factorial with recursion

func factorial(_ number: Int) -> Int {
    var res: Int
    if(number == 0) {
        return 1
    }
    res = number * factorial(number - 1)
    return res
}

factorial(3)

//reverse string

func reverse(_ inputString: String, outputString: String = "") -> String {
    if inputString.isEmpty {
        return outputString
    } else {
        let beforeIndex = inputString.index(inputString.endIndex, offsetBy: -1)
        return reverse(String(inputString[..<beforeIndex]),
                       outputString: outputString + String(inputString[beforeIndex...]))
    }
}

reverse("stringToReverse", outputString: "")

//* operation overload for char and int producing new string

func *(lhs: Character, rhs: Int) -> String {
    
    return ""
}
