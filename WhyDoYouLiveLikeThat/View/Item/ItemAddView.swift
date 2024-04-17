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
        NavigationStack {
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
                
                // 제목 셀
                TextField("제목인디", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                
                // 내용 셀
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(1), lineWidth: 0.5)
                    
                    TextEditor(text: $text)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(10)
                    
                    if text.isEmpty && !isEditing {
                        Text("내용인디")
                            .foregroundColor(.gray.opacity(0.6))
                            .padding(15)
                    }
                }
                .frame(height: .infinity)
                .cornerRadius(8)
                .padding(.horizontal, 20)
            }
            .navigationTitle("오늘을 기록해보세요")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ItemAddView()
}
