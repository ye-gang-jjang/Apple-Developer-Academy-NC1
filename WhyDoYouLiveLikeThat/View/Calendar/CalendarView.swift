//
//  CalendarView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    @State var isToggle = false
    
    var body: some View {
        VStack(spacing: 100) {
            LogoMovingView()
            
            DatePicker(
                "Calendar",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            Button(action: {
                
            }, label: {
                VStack {
                    GifImage("warawara")
                        .frame(width: 100, height: 100)
                }
                
            })
            
        }
    }
}

#Preview {
    CalendarView(selectedDate: .constant(Date()))
}
