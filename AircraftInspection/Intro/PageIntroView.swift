//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image(page.imageUrl)
                .resizable()
                .scaledToFit()
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.black)
                    .frame(height: 170)
                    .shadow(color: .black, radius: 50)
                VStack(alignment: .leading, spacing: 10){
                    Text(page.name)
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        
                    Text(page.description)
                        .foregroundStyle(.gray)
                    HStack{
                        Spacer()
                        if page.tag < 2 {
                            Image(systemName: page.tag == 0 ? "1.circle.fill" : "2.circle.fill")
                                .resizable()
                                .foregroundStyle(.redForApp)
                                .frame(width: 47, height: 47)
                        }
                    }
                    Spacer()
                }
                .padding()
                .frame(height: 170)
            }
        }
    }
}

#Preview {
    PageIntroView(page: PageIntro.samplePage)
}
