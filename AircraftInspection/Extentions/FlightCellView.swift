//
//  FlightCellView.swift
//  AircraftInspection
//
//  Created by Роман on 04.04.2024.
//

import SwiftUI

struct FlightCellView: View {
    
    @ObservedObject var viewModel: FlightViewModel
    @State var isPresented = false
    
    let flight: Flight
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 370, height: 89)
                .foregroundStyle(.cellBackground)
            HStack {
                VStack(alignment: .leading) {
                    Text("Check before \(flight.dateOfVertification ?? "")")
                        .foregroundStyle(.gray)
                    Text(flight.name ?? "")
                        .font(.title2)
                        .bold()
                }
                .frame(width: 180, height: 27)
                Spacer()
                
                Button(action: {
                    isPresented.toggle()
                    viewModel.chooseFlight = flight
                }, label: {
                    ZStack{
                        
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.redForApp)
                                    .frame(width: 124, height: 39)
                                Text("Start checking")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 13))
                                    .font(.system(.headline))
                            }
                        
                    }
                })

                .sheet(isPresented: $isPresented, content: {
                    FlightChekingView(viewModel: viewModel)
                })}
            .padding(30)
        }
    }
}

//#Preview {
//    FlightCellView()
//}
