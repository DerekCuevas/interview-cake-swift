//: Playground - noun: a place where people can play

import UIKit

extension Array {
    var mid: Element? {
        get {
            return self[self.count / 2]
        }
    }
}

class TempTracker {
    private var tempatures: [Double] = []
    
    private var sum: Double?
    private var minTemp: Double?
    private var maxTemp: Double?
    
    func insert(temp: Double) {
        tempatures.append(temp)
        tempatures.sort()
        
        sum = (sum ?? 0) + temp
        minTemp = minTemp.map { min($0, temp) } ?? temp
        maxTemp = maxTemp.map { max($0, temp) } ?? temp
    }
    
    func getMax() -> Double? {
        return maxTemp
    }
    
    func getMin() -> Double? {
        return minTemp
    }
    
    func getMean() -> Double? {
        return sum.map { $0 / Double(tempatures.count) }
    }
    
    func getMode() -> Double? {
        return tempatures.mid
    }
}

let tracker = TempTracker()
let temps = [5.0, 45.0, 3.7, 88.0, 57.9, 34.0]

for temp in temps {
    tracker.insert(temp: temp)
}

tracker.getMax()
tracker.getMin()
tracker.getMean()
tracker.getMode()

