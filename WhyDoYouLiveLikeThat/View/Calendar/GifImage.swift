//
//  AddButtonView.swift
//  WhyDoYouLiveLikeThat
//
//  Created by yegang on 4/12/24.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let ImgName: String
    
    init(_ ImgName: String) {
        self.ImgName = ImgName
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: ImgName, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        
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
