//
//  MonitorParametrsView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct MonitorParametrsView: View {
    
    @ObservedObject var viewModel: MonitoringViewModel
    @State private var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
            Spacer()
            Text(viewModel.chooseMonitor.name).font(.largeTitle).bold()
            Text("Plane parameters")
            Spacer()
            VStack{
                TextPlaneView(placeHolder: "Weight", text: String(viewModel.chooseMonitor.weight) + " kg")
                TextPlaneView(placeHolder: "Balance", text: String(viewModel.chooseMonitor.balance ? "Good" : "Bad"))
                    .foregroundStyle(viewModel.chooseMonitor.balance ? .green : .red)
                TextPlaneView(placeHolder: "Engine temperature", text: String(viewModel.chooseMonitor.engineTemperature) + " kg")
                TextPlaneView(placeHolder: "Air pressure", text: String(viewModel.chooseMonitor.airPressure) + " GPa")
                TextPlaneView(placeHolder: "Fuel consumption", text: String(viewModel.chooseMonitor.fuelConsumption) + " g/pass-km")
            }
        }
        //MARK: - ALERT
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Deletion"),
                  message: Text("Do you really want to delete it?"),
                  primaryButton: .cancel(Text("No")),
                  secondaryButton: .destructive(Text("Yes"), action: {
                viewModel.deleteMonitor()
                dismiss()
            }))
        })
        
        //MARK: - ToolBar
        .toolbar(content: {
            ToolbarItem(placement: .automatic) {
                HStack {
                    Image(systemName: "pencil")
                    Button(action: {showAlert = true}, label: {
                        Image(systemName: "trash.fill")
                    })
                    
                }
                
            }
        })
    }
}

#Preview {
    MonitorParametrsView(viewModel: MonitoringViewModel())
}
