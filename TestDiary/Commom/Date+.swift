//
//  CustomFSCalendar.swift
//  TestDiary
//
//  Created by Anatoliy on 16.01.2022.
//

import Foundation

extension Date {
    func convertToTimeZone(initTimeZone: TimeZone, timeZone: TimeZone) -> Date {
         let delta = TimeInterval(timeZone.secondsFromGMT(for: self) - initTimeZone.secondsFromGMT(for: self))
         return addingTimeInterval(delta)
    }
}
