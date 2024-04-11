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
            HStack(spacing: 25){
                Text("Balance")
                    .minimumScaleFactor(0.5)
                ButtonChooseView(action: {
                    viewModel.simplebalance = true
                }, choose: viewModel.simplebalance, title: "Good")
                ButtonChooseView(action: {
                    viewModel.simplebalance = false
                }, choose: !viewModel.simplebalance, title: "Violated")
            }
            Spacer()
            
            //MARK: - Save Button
            Button(action: {
                    viewModel.addmonitor()
                dismiss()
            }, label: {
                Text("SAVE").foregroundStyle(.black)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color.white)
            .cornerRadius(15)
            .navigationTitle(title)
        }.padding()
    }
}

#Preview {
    AddMonitorView(viewModel: MonitoringViewModel(), title: "Add plane")
}
