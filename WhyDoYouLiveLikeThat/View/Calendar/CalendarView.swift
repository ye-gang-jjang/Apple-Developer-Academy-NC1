////
////  CheckBoxCell.swift
////  WhyDoYouLiveLikeThat
////
////  Created by yegang on 4/15/24.
////

import SwiftUI

struct CalendarView: View {
    @Binding var month: Date
    @State var offset: CGSize = CGSize()
    @State private var selectedDate: Date? = nil
    @Binding var itemDateList: [ItemData]

    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 && canMoveToNextMonth() {
                        changeMonth(by: 1)
                        
                        
                    } else if gesture.translation.width > 100 && canMoveToPreviousMonth() {
                        changeMonth(by: -1)
                    }
                    self.offset = CGSize()
                }
        )
    }
    
    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack {
                Button(action: {
                    changeMonth(by: -1)
                }, label: {
                    Image(systemName: "chevron.backward")
                        .bold()
                        .padding(.leading, 10)
                    Spacer()
                })
                
                Text(month, formatter: Self.dateFormatter)
                    .font(.title)
                
                Button(action: {
                    changeMonth(by: +1)
                }, label: {
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .bold()
                        .padding(.trailing, 10)
                })
                .disabled(!canMoveToNextMonth())
            }
            .padding(.bottom, 10)
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        
                        // TODO: - 필터기능
                        let item = itemDateList.filter({ $0.date == Calendar.current.startOfDay(for: date)}).first
                            
                        CellView(date: date, day: day, item: item)
                            .onTapGesture {
                                selectedDate = date
                            }
                            .sheet(item: $selectedDate) { date in
                                ItemShowSheetView()
                            }
                            
                    }
                }
            }

        }
        .frame(width: .infinity, height: 290)
    }
}

// MARK: - 일자 셀 뷰
private struct CellView: View {
    var date: Date
    var day: Int
    var item: ItemData?
    
    var body: some View {
        VStack {
            // day 날짜 + 사각형
//            if date.isToday {
//                Text("오늘임")
//            }
            if let newItem = item {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.green)
                    .frame(width: 40, height: 40)
                    .overlay(Text(String(day)))
                    .foregroundColor(.black)
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray)
                    .frame(width: 40, height: 40)
                    .overlay(Text(String(day)))
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    CalendarView(month: .constant(Date.now), itemDateList: .constant([]))
}
