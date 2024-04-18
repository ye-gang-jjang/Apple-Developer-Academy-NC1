//
//  CalendarModel.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/17/24.
//
import SwiftUI

struct ItemData: Identifiable {
    let id: UUID = UUID()
    var date: Date
    var memoTitle: String
    var memoContent: String
    var level: Level
//    var image: [Image]
}

enum Level: String, CaseIterable {
    case level1
    case level2
    case level3
    case level4
    case level5
}

struct cntData: Hashable {
    var cnt: Int
}

enum BoxCellColor: Hashable {
    case red(cntData)
    case orange(cntData)
    case yellow(cntData)
    case green(cntData)
    case blue(cntData)
    
    var hexColor: String {
        switch self {
        case .red: return "FF7683"
        case .orange: return "FEC344"
        case .yellow: return "FFEA2E"
        case .green: return "79BF3C"
        case .blue: return "5FBFE4"
        }
    }
    
    var count: Int {
        switch self {
        case .red(let data), .orange(let data), .yellow(let data), .green(let data), .blue(let data):
            return data.cnt
        }
    }
}


let data: [BoxCellColor] = [
    .red(cntData(cnt: 12)),
    .orange(cntData(cnt: 21)),
    .yellow(cntData(cnt: 33)),
    .green(cntData(cnt: 58)),
    .blue(cntData(cnt: 10))
]
