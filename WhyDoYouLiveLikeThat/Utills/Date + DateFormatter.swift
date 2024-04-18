////
////  Date + DateFormatter.swift
////  WhyDoYouLiveLikeThat
////
////  Created by yegang on 4/15/24.
////
//
// MARK: - 내부 메서드

import SwiftUI

extension View {
    
}

extension String {
    
}

extension Date {
    var isToday: Bool {
        Calendar.current.startOfDay(for: self) == Calendar.current.startOfDay(for: Date())
    }
}

extension Calendar {
//    static func getDate(for day: Int) -> Date {
//        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
//    }
}

extension CalendarView {
    /// 특정 해당 날짜
    func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
    
//    func canMoveToNextMonth() -> Bool {
//        let currentDate = Date()
//        let calendar = Calendar.current
//        let targetDate = calendar.date(byAdding: .month, value: 0, to: currentDate) ?? currentDate
//        
//        return adjustedMonth(by: 1) > targetDate ? false : true
//    }
    
    func adjustedMonth(by value: Int) -> Date {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: month) {
            return newMonth
        }
        
        return month
    }
    
    /// 이전 월로 이동 가능한지 확인
    func canMoveToPreviousMonth() -> Bool {
      let currentDate = Date()
      let calendar = Calendar.current
      let targetDate = calendar.date(byAdding: .month, value: -12, to: currentDate) ?? currentDate
        
      if adjustedMonth(by: -1) < targetDate {
        return false
      }
      return true
    }
    
    /// 다음 월로 이동 가능한지 확인
      func canMoveToNextMonth() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let targetDate = calendar.date(byAdding: .month, value: 0, to: currentDate) ?? currentDate
        
        if adjustedMonth(by: 1) > targetDate {
          return false
        }
        return true
      }
}

// MARK: - Static 프로퍼티
extension CalendarView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM"
        return formatter
    }()
    
    static let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
}

extension Date: Identifiable {
    public var id: Date {
        self
    }
}

// MARK: - HomeView 에서 사용하는 dateFormatter
// TODO: - Date에 extension으로 수정

extension HomeView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM 월"
        return formatter
    }()
    
    static let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
}
