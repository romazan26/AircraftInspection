//
//  AnalyticsView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct AnalyticsView: View {
    @ObservedObject var viewModel: FlightViewModel
    var body: some View {
        VStack {
            
            //MARK: Title
            VStack {
                Text("Analytics").font(.title).bold()
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
        }.ignoresSafeArea()
    }
}

#Preview {
    AnalyticsView(viewModel: FlightViewModel())
}
