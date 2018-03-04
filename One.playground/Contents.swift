import UIKit

func getMaxProfit(prices: [Double]) -> Double? {
    if prices.count < 2 {
        return nil
    }
    
    var maxPrice = -Double.infinity
    var minPrice = Double.infinity
    
    for price in prices {
        maxPrice = max(maxPrice, price)
        minPrice = min(minPrice, price)
    }
    
    return maxPrice - minPrice
}

let stockPricesYesterday: [Double] = [10, 7, 5, 8, 11, 9]

let profit = getMaxProfit(prices: stockPricesYesterday)

print(profit ?? "Invalid input")
