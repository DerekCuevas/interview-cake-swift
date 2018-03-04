//: Playground - noun: a place where people can play

import UIKit

func getProductOfAllIntsExceptAtIndex(numbers: [Int]) -> [Int] {
    var products = [Int]()
    
    for (index, number) in numbers.enumerated() {
        var productForIndex = 1
        
        for (otherIndex, otherNumber) in numbers.enumerated() {
            if (index != otherIndex) {
                productForIndex *= otherNumber
            }
        }
        
        products.append(productForIndex)
    }
    
    return products
}

let numbers = [1, 7, 3, 4]
let products = getProductOfAllIntsExceptAtIndex(numbers: numbers)

products == [84, 12, 28, 21]

print(products)
