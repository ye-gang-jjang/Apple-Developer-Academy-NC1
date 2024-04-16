//
//  CalendarView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

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
    .red(cntData(cnt: 0)),
    .orange(cntData(cnt: 10)),
    .yellow(cntData(cnt: 30)),
    .green(cntData(cnt: 50)),
    .blue(cntData(cnt: 100))
]


struct HomeView: View {
    @State var date = Date.now
    @State private var year: String = "2024"
    @Binding var selectedDate: Date
        
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(HomeView.dateFormatter.string(from: date)) Total")
                    .font(.title)
                    .bold()
                
                HStack(spacing: 20) {
                    ForEach(data, id: \.self) { item in
                            CheckBoxCell(hexColor: item.hexColor, count: item.count)
                        }
                }
                
                HStack(alignment: .center) {
                    Text("혐생")
                        .padding(.leading, 50)
                    Spacer()
                    Text("갓생")
                        .padding(.trailing, 50)
                }
                .padding(.bottom, 30)
                
                CalendarView(month: $date)
                    .padding(.horizontal, 10)
                
                // WritingPageView로 이동하는 NavigationLink
                NavigationLink(destination: ItemAddView()) {
                    VStack {
                        RowLogoMoving()
                        
                        GifImage("warawara")
                            .frame(width: 150, height: 150)
                    }
                }
            }
        }
    }
}

extension HomeView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter
    }()
    
    static let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
}

#Preview {
    HomeView(selectedDate: .constant(Date()))
}
