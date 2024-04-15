//
//  CalendarView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var year: String = "2024"
    @Binding var selectedDate: Date
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("\(year) Total")
                    .font(.title)
                    .bold()
                
                HStack(spacing: 13) {
                    CheckBoxCell(hexColor: "FF7683")
                    CheckBoxCell(hexColor: "FEC344")
                    CheckBoxCell(hexColor: "FFEA2E")
                    CheckBoxCell(hexColor: "79BF3C")
                    CheckBoxCell(hexColor: "5FBFE4")
                }
                
                HStack {
                    Text("혐생")
                        .padding(.leading, 65)
                    Spacer()
                    Text("갓생")
                        .padding(.trailing, 65)
                }

                CalenderView(month: Date.now)
//                    .frame(maxHeight: 400)
                
                
                Button(action: {
                // MARK: - 작성 페이지로 넘어가는 NavigationLink 달아야 됨
                    
                }) {
                    VStack {
//                        RowLogoMoving()
                        
                        GifImage("warawara")
                            .frame(width: 200, height: 200)
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
