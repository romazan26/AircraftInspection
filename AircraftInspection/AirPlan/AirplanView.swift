//
//  AirplanView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct AirplanView: View {
    @ObservedObject var viewModel = AirplaneviewModel(planes: DataManager.shared.createTempData())
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack {
                Text("Arplain").font(.title).bold()
                Text("Add your airplane for maintenance")
                Image(.airplane)
                    .resizable()
                    .frame(width: 254, height: 94)
                NavigationLink(destination: AddPlaneView(viewModel: viewModel), label: {
                    ButtonCircle()
                })
                
                    .foregroundStyle(.accent)
               .offset(y: 100)
            }
            .foregroundStyle(.black)
            .padding(70)
            .background {
                Color(.white)
                    .cornerRadius(10)
            }
            
            
            Text("Your planes")
                .padding(5)
                .padding(.top, 20)
                
            ScrollView {
                ForEach(viewModel.planes) { plane in
                    AirplaneCellView(airplane: plane)
                }.onAppear(perform: {
                    print(viewModel.planes)
                })
            }
        }
    }
}

#Preview {
    AirplanView(viewModel: AirplaneviewModel(planes: DataManager.shared.createTempData()))
}
