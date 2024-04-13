//
//  LogoMovingView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/12/24.
//

import SwiftUI

struct LogoMovingView: View {
    @State private var isTrailing = true
    
    var body: some View {
        Text("나는 왜 이렇게 사는가")
            .font(.title)
            .foregroundStyle(.red)
        
        
//            .offset(x: isTrailing ? UIScreen.main.bounds.width : -UIScreen.main.bounds.width)
//            .onAppear {
//                withAnimation(Animation.linear(duration: 3.5).repeatForever(autoreverses: false)) {
//                    self.isTrailing.toggle()
//                }
//            }
    }
}




#Preview {
    LogoMovingView()
}
