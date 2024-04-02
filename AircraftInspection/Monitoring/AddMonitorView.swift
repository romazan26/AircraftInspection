//
//  AddMonitorView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct AddMonitorView: View {
    @ObservedObject var viewModel: MonitoringViewModel
    @Environment(\.dismiss) var dismiss
    
    var title = ""
    
    
    var body: some View {
        VStack {
            TextFieldPlaneView(placeHolder: "Name", text: $viewModel.simplename)
            TextFieldPlaneView(placeHolder: "Weight", text: $viewModel.simpleweight)
            TextFieldPlaneView(placeHolder: "Air Pressure", text: $viewModel.simpleairPressure)
            TextFieldPlaneView(placeHolder: "fuel Consumption", text: $viewModel.simplefuelConsumption)
            TextFieldPlaneView(placeHolder: "Temperature", text: $viewModel.simpleengineTemperature)
            Spacer()
            
            //MARK: - Save Button
            Button(action: {
                if title == "Add plane" {
                    viewModel.addmonitor()
                } else {
                   // viewModel.replaceInfoPlane()
                }
                dismiss()
            }, label: {
                Text("SAVE").foregroundStyle(.black)
    
            })
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color.white)
            .cornerRadius(15)
            .padding()
            
            .navigationTitle(title)
        }.onAppear(perform: {
            if title == "Edit" {
               // viewModel.fillChosePlane()
            }
        })
    }
}

#Preview {
    AddMonitorView(viewModel: MonitoringViewModel())
}
