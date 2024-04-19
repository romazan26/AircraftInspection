//
//  LoadingView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var percents: Float = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            Image(.imageogo2)
                .resizable()
                .frame(width: 314, height: 121)
                .padding(.top, 121)
             
            Image(.imageogo)
                .resizable()
               
                .frame(width: 431, height: 701)
                .padding(.top, 201)
            VStack {

                ProgressBarCircle(progress: percents * 0.01)
                    .animation(.spring, value: percents)
                    .frame(width: 98, height: 98)
            }
            .padding(.top, 670)
            
        }
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if percents < 100{
                    percents += 1
                }else {
                    timer.invalidate()
                    
                }
            }
        })
    }
}

#Preview {
    LoadingView()
}
