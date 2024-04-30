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
    @FocusState private var keyboardIsFocused: Bool
    
    var title = ""
    
    var body: some View {
        VStack {
            
            //MARK: - TextField Group
            TextFieldPlaneView(placeHolder: "Name", text: $viewModel.simplename)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Weight", text: $viewModel.simpleweight)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Air Pressure", text: $viewModel.simpleairPressure)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "fuel Consumption", text: $viewModel.simplefuelConsumption)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Temperature", text: $viewModel.simpleengineTemperature)
                .focused($keyboardIsFocused)
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
            .frame(height: 60)
            .background(Color.white)
            .cornerRadius(15)
            .navigationTitle(title)
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
        .padding()
    }
}

#Preview {
    AddMonitorView(viewModel: MonitoringViewModel(chooseMonitor: Monitoring()), title: "Add plane")
}
