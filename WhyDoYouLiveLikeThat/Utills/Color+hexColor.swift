//
//  Color+hexColor.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

extension Color {
    init(hexColor: String, opacity: Double = 1.0) {
        let hex = Int(hexColor, radix: 16)!
        
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
