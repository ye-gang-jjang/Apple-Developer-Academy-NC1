//
//  ItemCell.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/16/24.
//

import SwiftUI

struct ItemCell: View {
    var isEmpty = 0
    var imgName = ""
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        Button {
//            ImagePicker()
        } label: {
            ZStack {
                HStack {
                    if imgName.isEmpty {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 250, height: 250)
                                .foregroundStyle(Color(hexColor: "D9D9D9"))
                            
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                        }
                        
                    } else {
                        Image(imgName)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
            }
        }
    }
}

#Preview {
    ItemCell()
}
