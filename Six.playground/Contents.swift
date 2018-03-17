//: Playground - noun: a place where people can play

import UIKit

extension Range {
    func intersection(range: Range) -> Range? {
        if !self.overlaps(range) {
            return nil
        }
        
        let lowerBound = max(range.lowerBound, self.lowerBound)
        let upperBound = min(range.upperBound, self.upperBound)
        
        return lowerBound ..< upperBound
    }
}

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
        
        if let horizontalIntersection = horizontalRange.intersection(range: rect.horizontalRange),
            let verticalIntersection = verticalRange.intersection(range: rect.verticalRange) {
            return Rect(
                x: horizontalIntersection.lowerBound,
                y: verticalIntersection.lowerBound,
                width: horizontalIntersection.upperBound - horizontalIntersection.lowerBound,
                height: verticalIntersection.upperBound - verticalIntersection.lowerBound
            )
        }
        
        return nil
    }
}

let rectA = Rect(x: 0, y: 0, width: 10, height: 10)
let rectB = Rect(x: 2, y: 5, width: 5, height: 5)

let intersectingRect = rectA.intersection(rect: rectB)
