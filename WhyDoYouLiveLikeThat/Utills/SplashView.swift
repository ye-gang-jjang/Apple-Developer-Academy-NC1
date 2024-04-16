//
//  SplashView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/11/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimationStarted = false
    
    var body: some View {
        VStack {
            if !isAnimationStarted {
                Image("why")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(isAnimationStarted ? 0.5 : 1.0)
                    .opacity(isAnimationStarted ? 0.0 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 5.0)) {
                            self.isAnimationStarted.toggle()
                        }
                    }
            }
        }
    }
}


#Preview {
    SplashView()
}
