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
            
            //MARK: Title
            VStack {
                Text("Arplain").font(.title).bold()
                Text("Add your airplane for maintenance")
                Image(.airplane)
                    .resizable()
                    .frame(width: 254, height: 94)
                
                //MARK: Add Button
                NavigationLink(destination: AddPlaneView(viewModel: viewModel, title: "Add plane"), label: {
                    ButtonCircle()
                })
                .foregroundStyle(.redForApp)
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
            
            //MARK: - Planes
            ScrollView {
                ForEach(viewModel.planes) { plane in
                    NavigationLink(destination: PlaneInfoView(viewModel: viewModel, plane: plane)) {
                        AirplaneCellView(airplane: plane).frame(height: 108)
                    }
                }
            }
        }
    }
}

#Preview {
    AirplanView(viewModel: AirplaneviewModel(planes: DataManager.shared.createTempData()))
}
