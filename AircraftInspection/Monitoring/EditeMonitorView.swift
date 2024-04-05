//
//  EditeMonitorView.swift
//  AircraftInspection
//
//  Created by Роман on 03.04.2024.
//

import SwiftUI

struct EditeMonitorView: View {
    
    @ObservedObject var viewModel: MonitoringViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20){
            
            VStack{
                TextFieldPlaneView(placeHolder: "Weight", text: $viewModel.simpleweight)
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
                TextFieldPlaneView(placeHolder: "Air pressure", text: $viewModel.simpleairPressure)
                TextFieldPlaneView(placeHolder: "Fuel consumption", text: $viewModel.simplefuelConsumption)
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
    }
}

#Preview {
    EditeMonitorView(viewModel: MonitoringViewModel())
}
