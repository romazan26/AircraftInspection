//
//  FligtsView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct FligtsView: View {
    
    @ObservedObject var viewModel: FlightViewModel
    @State private var showingConfirmation = false
    
    var body: some View {
        VStack {
            VStack {
                
                //MARK: Title
                
                HStack {
                    Spacer()
                    Text("Flights").font(.title).bold()
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
                Text("Fill out nearest flights to check the aircraft")
                Image(.flight)
                    .resizable()
                    .frame(width: 112, height: 112)
                
                //MARK: Add Button
                NavigationLink(destination: AddFlightView(viewModel: viewModel), label: {
                                    ButtonCircle()
                                })
                                .foregroundStyle(.redForApp)
                                .offset(y: 40)
            }
            .foregroundStyle(.black)
            .padding(.top, 86)
            .background {
                Color(.white)
                    .frame(width: 393, height: 338)
                    .cornerRadius(10)
            }
            
            //MARK: - Flight
            VStack(alignment: .leading) {
                Text("Nearest flights")
                    .padding(5)
                    
                ScrollView {
                    ForEach(viewModel.flights) { flight in
                        FlightCellView(viewModel: viewModel, flight: flight)
                    }
                }
            }.padding(.top, 30)
        }
        .sheet(isPresented: $showingConfirmation, content: {
            SettingsView()
                .presentationDetents([.medium])
        })
        .ignoresSafeArea()
    }
}

#Preview {
    FligtsView(viewModel: FlightViewModel())
}
