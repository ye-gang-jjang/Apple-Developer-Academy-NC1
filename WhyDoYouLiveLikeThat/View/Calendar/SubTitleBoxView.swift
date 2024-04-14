//
//  SubTitleBoxView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/14/24.
//

import SwiftUI

struct TriangleView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

struct SubTitleBoxView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                // 말풍선 모양의 테두리
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 180, height: 30)
                    .transition(.opacity)
                
                
                // 설명 내용
                Text("고객센터에 문의해주세요.")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .transition(.opacity)
                    .foregroundColor(Color.red)
            }
            TriangleView()
                .foregroundColor(Color.orange)
                .frame(width: 18, height: 12)
            Rectangle()
                .frame(width: 150, height: 120)
                .foregroundColor(Color.white.opacity(0))
        }
    }
}

#Preview {
    SubTitleBoxView()
}
