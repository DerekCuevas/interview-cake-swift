//: Playground - noun: a place where people can play

import UIKit

struct Rect {
    let x: Double
    let y: Double
    let width: Double
    let height: Double
    
    var horizontalRange: Range<Double> {
        get {
            return x..<x + width
        }
    }
    
    var verticalRange: Range<Double> {
        get {
            return y..<y + height
        }
    }
    
    func isOverlap(rect: Rect) -> Bool {
        return verticalRange.overlaps(rect.verticalRange)
            && horizontalRange.overlaps(rect.horizontalRange)
    }
    
    func intersection(rect: Rect) -> Rect? {
        if !isOverlap(rect: rect) {
            return nil
        }
        
        // TODO: return Rect w/intersecting vertical + horizontal ranges
        return self
    }
}

let rectA = Rect(x: 0, y: 0, width: 10, height: 10)
let rectB = Rect(x: 2, y: 5, width: 5, height: 5)

let intersectingRect = rectA.intersection(rect: rectB)

print(rectA.isOverlap(rect: rectB))
