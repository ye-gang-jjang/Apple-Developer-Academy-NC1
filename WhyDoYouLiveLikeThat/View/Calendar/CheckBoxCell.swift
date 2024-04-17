//
//  CheckBoxCell.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/15/24.
//

import SwiftUI


struct CheckBoxCell: View {
    let hexColor: String
    let count: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 45, height: 45)
                .foregroundStyle(Color(hexColor: hexColor))
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray)
                .frame(width: 45, height: 45)
            
            Text("\(count)")
        }
    }
}


#Preview {
    CheckBoxCell(hexColor: "FDE426", count: 10)
}
