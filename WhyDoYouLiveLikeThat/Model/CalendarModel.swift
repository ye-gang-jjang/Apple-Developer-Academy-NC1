//
//  CalendarModel.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/17/24.
//
import SwiftUI

class DateStore: Identifiable {
    let id: UUID = UUID()
    var date: Date
    var level: Level
    
    var image: [Image]
    var memoTitle: String
    var memoContent: String
    
    init(date: Date, level: Level, image: [Image], memoTitle: String, memoContent: String) {
        self.date = date
        self.level = level
        self.image = image
        self.memoTitle = memoTitle
        self.memoContent = memoContent
    }
}

enum Level: Int {
    case level1
    case level2
    case level3
    case level4
    case level5
}

