//
//  DataSheetView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/15/24.
//

import SwiftUI

struct ItemShowSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State var title: String = "하이뚠"
    @State var text: String = "안녕하세요 라프에요"
    @State var isEditing = false
    
    @Binding var itemDateList: [ItemData]
    @Binding var selectedDate : Date?
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Capsule()
                    .fill(Color.secondary)
                    .opacity(0.5)
                    .frame(width: 70, height: 5)
                    .padding(6)
                    .offset(y: -40)
                
                TabView {
                    
                    ItemCell(imgName: "vvv")
                    ItemCell(imgName: "www")
                    ItemCell(imgName: "nnn")
                }
                .frame(width: 300, height: 350)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                // 제목 셀
                TextField("제목인디", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                
//                Text("\(selectedDate)")
                
                // 내용 셀
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(1), lineWidth: 0.5)
                    
                    TextEditor(text: $text)
                        .foregroundColor(.primary)
                        .padding(3)
                    
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //TODO: - 저장하기 함수 만들기
                        dismiss()
                    } label: {
                        Text("수정")
                            .bold()
                    }
                }
            }
        }
    }
}

//#Preview {
//    ItemShowSheetView(itemDateList: [], selectedDate: .constant(.now))
//}
