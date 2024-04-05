//
//  AnalyticInfoView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct AnalyticInfoView: View {
    
    let flight: Flight
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @ObservedObject var viewModel: FlightViewModel
    
    var body: some View {
        VStack {
            Text(flight.name)
                .font(.largeTitle)
                .bold()
            TextPlaneView(placeHolder: "Date of verification", text: flight.dateOfVertification)
            
            TextPlaneView(placeHolder: "Systems and components",
                          text: flight.systemsOfComponents ? "Good" : "Violated")
            .foregroundStyle(flight.systemsOfComponents ? .green : .red)
            
            TextPlaneView(placeHolder: "Electronics and avionis",
                          text: flight.electronicsAndAvoinics ? "Good" : "Violated")
                .foregroundStyle(flight.electronicsAndAvoinics ? .green : .red)
            
            TextPlaneView(placeHolder: "Identification and certification",
                          text: flight.identificationAndCertification ? "Good" : "Violated")
                .foregroundStyle(flight.identificationAndCertification ? .green : .red)
            
            TextPlaneView(placeHolder: "Notes", text: flight.note)
            
            //MARK: - ALERT
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Deletion"),
                      message: Text("Do you really want to delete it?"),
                      primaryButton: .cancel(Text("No")),
                      secondaryButton: .destructive(Text("Yes"), action: {
                    viewModel.deleteFlight(flightId: flight.id)
                    dismiss()
                }))
            })
                .toolbar(content: {
                    ToolbarItem {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Image(systemName: "trash.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    AnalyticInfoView(flight: DataManager.shared.createTempDataFlight()[0], viewModel: FlightViewModel())
}
