//
//  FligtsView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct FligtsView: View {
    
    @ObservedObject var viewModel: FlightViewModel
    
    var body: some View {
        VStack {
            VStack {
                
                //MARK: Title
                Text("Flights").font(.title).bold()
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
        }.ignoresSafeArea()
    }
}

#Preview {
    FligtsView(viewModel: FlightViewModel())
}
