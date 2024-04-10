//
//  SettingsView.swift
//  AircraftInspection
//
//  Created by Роман on 09.04.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.requestReview) var requestRewiew
    @State private var isPresentPolicy = false
    @State private var isPresentSupport = false
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 10 , height: 18)
                        .foregroundStyle(.white)
                        
                })
                Spacer()
                Text("Settings")
                    .font(.title)
                .bold()
                Spacer()
            }.padding()
            
            //MARK: - Share app
            ShareLink(item: URL(string: "https://www.google.com/")!) {
                SettingRow(name: "Share app", imageName: "square.and.arrow.up")
            }
            
            //MARK: - Usage Policy
            Button(action: { isPresentPolicy = true}, label: {
                SettingRow(name: "Usage Policy", imageName: "doc.on.doc")
            })
            
            //MARK: - Rate app
            Button {
                requestRewiew()
            } label: {
                SettingRow(name: "Rate app", imageName: "star")
            }

            //MARK: - Support
            Button(action: {isPresentSupport = true}, label: {
                SettingRow(name: "Support", imageName: "mappin.and.ellipse.circle")
            })
            
            
            //MARK: - Date
            Text(Date.now.formatted())
                .font(.subheadline)
            
            Spacer()
        }
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: "https://www.apple.com")!)
        })
        .sheet(isPresented: $isPresentSupport, content: {
            WebViewPage(urlString: URL(string: "https://www.google.com")!)
        })
        .padding()
    }
        
}

#Preview {
    SettingsView()
}

struct SettingRow: View {
    let name: String
    let imageName: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.cellBackground)
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .foregroundStyle(.white)
                Spacer()
                Text(name)
                    .foregroundStyle(.gray)
                Spacer()
            }.padding()
        }.frame(width: 335, height: 54)
    }
}
