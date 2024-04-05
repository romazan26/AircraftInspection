//
//  AnalyticsView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct AnalyticsView: View {
    @ObservedObject var viewModel: FlightViewModel
    @State private var showingConfirmation = false
    var body: some View {
        VStack {
            
            //MARK: Title
            VStack {
                
                HStack {
                    Spacer()
                    Text("Analytics").font(.title).bold()
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
                Text("Your reports will be displayed here")
                Image(.analitic)
                    .resizable()
                    .frame(width: 112, height: 112)
            }
            .foregroundStyle(.black)
            .padding(.top, 86)
            .background {
                Color(.white)
                    .frame(width: 393, height: 410)
                    .cornerRadius(10)
            }
            //MARK: - Planes
            VStack(alignment: .leading) {
                ScrollView {
                    ForEach(viewModel.flights) { flight in
                        NavigationLink {
                            AnalyticInfoView(flight: flight, viewModel: viewModel)
                        } label: {
                            AnalyticCellView(flight: flight)
                        }
                    }
                }
            }.padding(.top, 90)
        }
        
        .confirmationDialog("Settings", isPresented: $showingConfirmation, titleVisibility: .visible, actions: {
            Button("Share app") {}
            Button("Usage Policy") {}
            Button("Rate app") {}
            Button("Support") {}
        }, message: {
            Text(Date.now.formatted())
        })
        .ignoresSafeArea()
    }
}

#Preview {
    AnalyticsView(viewModel: FlightViewModel())
}
