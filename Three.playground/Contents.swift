//: Playground - noun: a place where people can play

import UIKit

func highestProductOfThree(numbers: [Int]) -> Int? {
    if numbers.count < 3 {
        return nil
    }
    
    let sorted = numbers.sorted()
    
    let smallestTwo = sorted.prefix(2)
    let largestThree = sorted.suffix(3)
    let largest = sorted.last ?? 1
    
    return max(largestThree.reduce(1, *), smallestTwo.reduce(1, *) * largest)
}

let numbers = [-10, 1, -10, 3, 2]
let product = highestProductOfThree(numbers: numbers)

print(product)
