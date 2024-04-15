//
//  CheckBoxCell.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/14/24.
//

import SwiftUI

struct CheckBoxCell: View {
    @State var hexColor: String
    @State var opacity: Double = 1.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 45, height: 45)
            .foregroundStyle(Color(hexColor: hexColor))
    }
}

#Preview {
    CheckBoxCell(hexColor: "FDE426", opacity: 1.0)
}
