//
//  CalendarView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

enum BoxCellColor: String, CaseIterable {
    case red = "FF7683"
    case orange = "FEC344"
    case yellow = "FFEA2E"
    case green = "79BF3C"
    case blue = "5FBFE4"
    
}

struct HomeView: View {
    @State private var year: String = "2024"
    @Binding var selectedDate: Date
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(year) Total")
                    .font(.title)
                    .bold()
                
                HStack(spacing: 10) {
                    ForEach(BoxCellColor.allCases, id: \.self) { color in
                        CheckBoxCell(hexColor: color.rawValue)
                    }
                }
                
                HStack {
                    Text("혐생")
                        .padding(.leading, 65)
                    Spacer()
                    Text("갓생")
                        .padding(.trailing, 65)
                }
                
                CalendarView(month: Date.now)
                    .frame(width: .infinity, height: 400)
                    .border(.red)
                
                Spacer()
                
                Button(action: {
                    // MARK: - 작성 페이지로 넘어가는 NavigationLink 달아야 됨
                    
                }) {
                    VStack {
                        RowLogoMoving()
                        
                        GifImage("warawara")
                            .frame(width: 100, height: 100)
                            .border(Color.red)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(selectedDate: .constant(Date()))
}
