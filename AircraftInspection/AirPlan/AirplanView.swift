//
//  AirplanView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct AirplanView: View {
    @ObservedObject var viewModel: AirplaneviewModel
    @State private var showingConfirmation = false
    var body: some View {
        VStack(spacing: 15) {
            
            //MARK: Title
            VStack {
                HStack {
                    Spacer()
                    Text("Arplaine").font(.title).bold()
                    Spacer()
                    Button {
                        showingConfirmation = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundStyle(.redForApp)
                    }

                }.padding(.horizontal)
                Text("Add your airplane for maintenance")
                Image(.airplane)
                    .resizable()
                    .frame(width: 254, height: 94)
                
                //MARK: Add Button
                NavigationLink(destination: AddPlaneView(viewModel: viewModel, title: "Add plane"), label: {
                    ButtonCircle()
                })
                .foregroundStyle(.redForApp)
                .offset(y: 45)
            }
            .foregroundStyle(.black)
            .padding(.top, 86)
            .background {
                Color(.white)
                    .frame(width: 393, height: 338)
                    .cornerRadius(10)
            }
           
            //MARK: - Planes
            VStack(alignment: .leading) {
                Text("Your planes")
                    .padding(5)
                    .padding(.top, 20)
                ScrollView {
                    ForEach(viewModel.planes) { plane in
                        NavigationLink(destination: PlaneInfoView(viewModel: viewModel, plane: plane)) {
                            AirplaneCellView(airplane: plane).frame(height: 108)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingConfirmation, content: {
            SettingsView()
                .presentationDetents([.medium])
        })
        .ignoresSafeArea()
    }
}

#Preview {
    AirplanView(viewModel: AirplaneviewModel())
}
