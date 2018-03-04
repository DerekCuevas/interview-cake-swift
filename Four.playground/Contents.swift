//: Playground - noun: a place where people can play

import UIKit

// implement Eq?
struct Meeting {
    let startTime: TimeInterval
    let endTime: TimeInterval
    
    func isOverlap(meeting: Meeting) -> Bool {
        return false
    }
}

func mergeMeetings(meetings: [Meeting]) -> [Meeting] {
    return meetings
}

let meetings = [
    Meeting(startTime: 0, endTime: 1),
    Meeting(startTime: 3, endTime: 5),
    Meeting(startTime: 4, endTime: 6),
    Meeting(startTime: 1, endTime: 2)
]

let merged = mergeMeetings(meetings: meetings)
let condensed = [Meeting(startTime: 0, endTime: 2), Meeting(startTime: 3, endTime: 6)]

