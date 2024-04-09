//
//  SettingsView.swift
//  AircraftInspection
//
//  Created by Роман on 09.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
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
                    .font(.largeTitle)
                .bold()
                Spacer()
            }.padding()
            SettingRow(name: "Share app", imageName: "square.and.arrow.up")
            SettingRow(name: "Usage Policy", imageName: "doc.on.doc")
            SettingRow(name: "Rate app", imageName: "star")
            SettingRow(name: "Support", imageName: "mappin.and.ellipse.circle")
            Text(Date.now.formatted())
                .padding(.top, 40)
            Spacer()
        }.padding()
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
                Spacer()
                Text(name)
                    .foregroundStyle(.gray)
                Spacer()
            }.padding()
        }.frame(width: 335, height: 64)
    }
}
