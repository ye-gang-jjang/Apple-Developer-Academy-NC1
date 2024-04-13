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
        VStack {
            LogoMovingView()

            Form {
                DatePicker(
                    "ㅎㅇ",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                    .datePickerStyle(.graphical)
            }
        }
    }
}

#Preview {
    CalendarView(selectedDate: .constant(Date()))
}
