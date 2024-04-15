//
//  CalendarHeaderView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/15/24.
//

// HeaderView.swift

import SwiftUI

struct CalendarHeaderView: View {
    @State var previewMonth = Date()
    @Binding var month: Date
    
    let changeMonth: (Int) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    changeMonth(-1)
                }, label: {
                    Image(systemName: "chevron.backward")
                        .bold()
                        .padding(.leading, 20)
                    Spacer()
                })
                
                Text(month, formatter: CalendarView.dateFormatter)
                    .font(.title)
                
                Button(action: {
                    changeMonth(1)
                }, label: {
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .bold()
                        .padding(.trailing, 20)
                })
                
            }
            
            HStack {
                ForEach(CalendarView.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
}

