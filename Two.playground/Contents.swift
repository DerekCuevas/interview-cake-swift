//: Playground - noun: a place where people can play

import UIKit

func getProductOfAllIntsExceptAtIndex(numbers: [Int]) -> [Int] {
    var products: [Int] = []
    
    for index in 0..<numbers.count {
        var productForIndex = 1
        
        for (otherIndex, otherNumber) in numbers.enumerated() {
            if index != otherIndex {
                productForIndex *= otherNumber
            }
        }
        
        products.append(productForIndex)
    }
    
    return products
}

func getProductBeforeEach(numbers: [Int]) -> [Int] {
    var productsBeforeEach: [Int] = []
    var productBefore = 1
    
    for number in numbers {
        productsBeforeEach.append(productBefore)
        productBefore *= number
    }
    
    return productsBeforeEach
}

func getProductOfAllIntsExceptAtIndexFast(numbers: [Int]) -> [Int] {
    let productsBeforeEach = getProductBeforeEach(numbers: numbers)
    let productsAfterEach = getProductBeforeEach(numbers: numbers.reversed()).reversed()
    
    return zip(productsBeforeEach, productsAfterEach).map { (beforeProduct: Int, afterProduct: Int) -> Int in
        beforeProduct * afterProduct
    }
}

let numbers = [1, 7, 3, 4]
let products = getProductOfAllIntsExceptAtIndexFast(numbers: numbers)

products == [84, 12, 28, 21]

print(products)
