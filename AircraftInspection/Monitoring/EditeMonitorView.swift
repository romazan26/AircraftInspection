//
//  EditeMonitorView.swift
//  AircraftInspection
//
//  Created by Роман on 03.04.2024.
//

import SwiftUI

struct EditeMonitorView: View {
    
    @ObservedObject var viewModel: MonitoringViewModel
    @FocusState private var keyboardIsFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20){
            
            VStack{
                TextFieldPlaneView(placeHolder: "Weight", text: $viewModel.simpleweight)
                    .focused($keyboardIsFocused)
                HStack(spacing: 25){
                    Text("Balance")
                    ButtonChooseView(action: {
                        viewModel.simplebalance = true
                    }, choose: viewModel.simplebalance, title: "Good")
                    ButtonChooseView(action: {
                        viewModel.simplebalance = false
                    }, choose: !viewModel.simplebalance, title: "Violated")
                }
                TextFieldPlaneView(placeHolder: "Engine temperature", text: $viewModel.simpleengineTemperature)
                    .focused($keyboardIsFocused)
                TextFieldPlaneView(placeHolder: "Air pressure", text: $viewModel.simpleairPressure)
                    .focused($keyboardIsFocused)
                TextFieldPlaneView(placeHolder: "Fuel consumption", text: $viewModel.simplefuelConsumption)
                    .focused($keyboardIsFocused)
                Spacer()
                
                //MARK: - Save Button
                Button(action: {
                    viewModel.replaceMonitor()
                    
                    dismiss()
                }, label: {
                    Text("SAVE").foregroundStyle(.black)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 67)
                .background(Color.white)
                .cornerRadius(15)
                .padding()
            }
            .onAppear(perform: {
                viewModel.fillChooseMonitor()
            })
            .navigationTitle("Edite")
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
    }
}

#Preview {

    EditeMonitorView(viewModel: MonitoringViewModel(chooseMonitor: Monitoring()))
}
