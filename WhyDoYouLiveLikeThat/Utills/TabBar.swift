//
//  TabBar.swift
//  HaruCapsule
//
//  Created by yegang on 3/24/24.
//

import SwiftUI

enum Tab {
    case a, b, c
}

struct TabBar: View {
    @Binding var selected: Tab
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                selected = .a
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "calendar.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            }
            .foregroundStyle(selected == .a ? Color.accentColor : Color.primary)
            
            Spacer()
            Button {
                selected = .b
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            }
            .foregroundStyle(selected == .b ? Color.accentColor : Color.primary)
            Spacer()
            Button {
                selected = .c
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            }
            .foregroundStyle(selected == .c ? Color.accentColor : Color.primary)
            Spacer()
        }
        .padding()
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    TabBar(selected: .constant(Tab.a))
}
