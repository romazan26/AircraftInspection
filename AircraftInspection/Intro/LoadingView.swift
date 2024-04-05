//
//  LoadingView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var percents: CGFloat = 0
    
    var body: some View {
        ZStack{
            Image(.imageLoading)
                .resizable()
                .scaledToFill()
            VStack {
                ProgressBarView(width: 330, height: 10, percents: percents)
                    .animation(.spring, value: percents)
                
                Text("\(Int(percents))%")
                    .font(.title3)
                    .bold()
            }
            .padding()
            .offset(y: 100)
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
