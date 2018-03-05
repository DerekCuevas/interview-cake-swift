//: Playground - noun: a place where people can play

import UIKit

struct Meeting {
    let startTime: TimeInterval
    let endTime: TimeInterval
    
    func isOverlap(_ meeting: Meeting) -> Bool {
        var firstMeeting: Meeting = meeting
        var secondMeeting: Meeting = self
        
        if firstMeeting.startTime > secondMeeting.startTime {
            firstMeeting = self
            secondMeeting = meeting
        }
        
        return firstMeeting.endTime >= secondMeeting.startTime
    }
    
    func merge(_ meeting: Meeting) -> Meeting {
        return Meeting(
            startTime: min(meeting.startTime, self.startTime),
            endTime: max(meeting.endTime, self.endTime)
        )
    }
}

func sortMeetings(meetings: [Meeting]) -> [Meeting] {
    return meetings.sorted { (meetingA: Meeting, meetingB: Meeting) -> Bool in
        if meetingA.startTime == meetingB.startTime {
            return meetingA.endTime < meetingB.endTime
        }
        
        return meetingA.startTime < meetingB.startTime
    }
}

func mergeMeetings(meetings: [Meeting]) -> [Meeting] {
    let sorted = sortMeetings(meetings: meetings)
    
    return sorted.reduce([Meeting]()) { (merged: [Meeting], meeting: Meeting) -> [Meeting] in
        if let previousMeeting = merged.last {
            if previousMeeting.isOverlap(meeting) {
                return merged.dropLast() + [meeting.merge(previousMeeting)]
            }
        }
        
        return merged + [meeting]
    }
}

let meetingA = Meeting(startTime: 3, endTime: 5)
let meetingB = Meeting(startTime: 4, endTime: 6)

meetingA.isOverlap(meetingB)

let meetings = [
    Meeting(startTime: 0, endTime: 1),
    Meeting(startTime: 3, endTime: 5),
    Meeting(startTime: 4, endTime: 6),
    Meeting(startTime: 3, endTime: 4),
    Meeting(startTime: 1, endTime: 2)
]

let merged = mergeMeetings(meetings: meetings)
let condensed = [Meeting(startTime: 0, endTime: 2), Meeting(startTime: 3, endTime: 6)]

