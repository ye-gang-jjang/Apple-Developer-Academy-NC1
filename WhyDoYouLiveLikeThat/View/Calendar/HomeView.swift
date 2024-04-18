//
//  CalendarView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var date = Date.now
    @State var itemDateList: [ItemData] = [
        ItemData(date: .now, memoTitle: "쌈뽕한 하루", memoContent: "ㅎㅇ", level: Level.level3)
    ]
//    @Binding var selectedDate: Date
    
    var body: some View {
        NavigationStack {
            Text("\(HomeView.dateFormatter.string(from: date)) Total")
                .font(.title)
                .bold()
                .padding(.top, 50)
            
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
            .padding(.bottom, 10)
            
            CalendarView(month: $date, itemDateList: $itemDateList)
                .padding(.horizontal, 10)
            
            RowLogoMoving()
            
            // WritingPageView로 이동하는 NavigationLink
            NavigationLink(destination: ItemAddView(itemDateList: $itemDateList)) {
                GifImage("warawara")
                    .frame(width: 150, height: 150)
            }
        }
    }
}


#Preview {
    HomeView()
}
