//
//  DataAddView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/15/24.
//

import SwiftUI

struct ItemAddView: View {
    @State var title: String = ""
    @State var text: String = ""
    @State var isEditing = false
    
    
    var body: some View {
        VStack {
            TabView {
                ItemCell()
                ItemCell(imgName: "vvv")
                ItemCell(imgName: "www")
                ItemCell(imgName: "nnn")
            }
            .frame(width: 300, height: 400)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            TextField("제목인디", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .foregroundColor(.primary)
                
                if text.isEmpty && !isEditing {
                    Text("내용인디")
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 0))
                }
                
            }
            .frame(height: .infinity)
            .cornerRadius(8)
            .background(Color.secondary.opacity(0.1))
        }
    }
}

#Preview {
    ItemAddView()
}
