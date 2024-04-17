//
//  AddButtonView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/12/24.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let imgName: String
    private let scaleFactor: CGFloat
    
    init(_ imgName: String, scaleFactor: CGFloat = 0.2) {
        self.imgName = imgName
        self.scaleFactor = scaleFactor
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: imgName, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        
        // Apply scale transform to reduce size
        webView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
    
    typealias UIViewType = WKWebView
}

#Preview {
    GifImage("warawara")
}
