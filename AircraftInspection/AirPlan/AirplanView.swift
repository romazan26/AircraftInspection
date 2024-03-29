//
//  AirplanView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct AirplanView: View {
    @ObservedObject var viewModel = AirplaneviewModel()
    var body: some View {
        VStack {
            
            VStack {
                Text("Arplain").font(.title).bold()
                Text("Add your airplane for maintenance")
                Image(.airplane)
                    .resizable()
                    .frame(width: 254, height: 94)
            }
            .foregroundStyle(.black)
            .padding(70)
            .background {
                Color(.white)
                    .cornerRadius(10)
            }
            ButtonCircle()
           .offset(y: -37)
            Text("Your planes")
            ScrollView {
                ForEach(viewModel.planes, id: \.self.id ) { plane in
                    Text(plane.name)
                }
            }
        }
    }
}

#Preview {
    AirplanView()
}
