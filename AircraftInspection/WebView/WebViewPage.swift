//
//  WebViewPage.swift
//  AircraftInspection
//
//  Created by Роман on 10.04.2024.
//

import SwiftUI

struct WebViewPage: View {
    @State private var isLoading = true
    let urlString: URL
    
    var body: some View {
        ZStack {
            WebView(urlString: urlString, isLoading: $isLoading)
            if isLoading {
               ProgressView()
            }
        }
        
    }
}

#Preview {
    WebViewPage(urlString: URL(string: "www.google.com")!)
}
