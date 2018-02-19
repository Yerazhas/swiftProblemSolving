//: Playground - noun: a place where people can play

import UIKit

//storing aithmetic operations in dictionary

let ops: [String: ((Int, Int) -> Int)] = [
    "+": (+),
    "-": (-),
    "*": (*),
    "/": (/)
]

//postfix evaluation

func parseExpression(_ expression: String) -> Int {
    let tokens = expression.split(separator: " ")
    var stack = [Int]()
    for token in tokens {
        if let op = ops[String(token)] {
            let arg2 = stack.removeLast()
            let arg1 = stack.removeLast()
            let result = op(arg1, arg2)
            stack.append(result)
        } else {
            stack.append(Int(token)!)
        }
    }
    
    return stack.removeLast()
}

parseExpression("943 12 3 + - 5 +")

//prefix evaluation

func parseReversedExpression(_ expression: String) -> Int {
    let tokens = expression.split(separator: " ").reversed()
    var stack = [Int]()
    for token in tokens {
        if let op = ops[String(token)] {
            let arg2 = stack.removeLast()
            let arg1 = stack.removeLast()
            let result = op(arg1, arg2)
            stack.append(result)
        } else {
            stack.append(Int(token)!)
        }
    }
    
    return stack.removeLast()
}

parseReversedExpression("+ 5 - + 3 12 943")

//get reversed string deprecated version

func getReversedString(from string: String, output: String = "") -> String {
    if string.isEmpty {
        return output
    } else {
        return getReversedString(from: string.substring(to: string.index(before: string.endIndex)),
                                 output:output + string.substring(from: string.index(before: string.endIndex)))
    }
}

print(getReversedString(from: "getReversedString"))

//string substring methods

let str = "random string"
let index = str.index(str.endIndex, offsetBy: -5)
str[str.startIndex..<index]

print(str.substring(from: str.index(before: str.endIndex)))
print(str[str.index(str.endIndex, offsetBy: -1)...])

//reverse string without loops, built-in array methods etc

func reversed(_ input: String, output: String = "") -> String {
    if input.isEmpty {
        return output
    } else {
        let beforeIndex = input.index(input.endIndex, offsetBy: -1)
        
        return reversed(String(input[..<beforeIndex]), output: output + String(input[beforeIndex...]))
    }
}

reversed("asdasd", output: "")






