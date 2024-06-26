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
        VStack(spacing: 20){
            
            VStack {
                Text(viewModel.chooseMonitor.name ?? "").font(.largeTitle).bold()
                Text("Plane parameters")
            }.padding(.top, -80)
            
            
            VStack{
                TextPlaneView(placeHolder: "Weight", text: String(viewModel.chooseMonitor.weight) + " kg")
                    .onAppear(perform: {
                        print(viewModel.simpleweight)
                    })
                ZStack {
                    TextPlaneView(placeHolder: "Balance", text: String(viewModel.chooseMonitor.balance ? "Good" : "Violated"))
                        .foregroundStyle(viewModel.chooseMonitor.balance ? .green : .red)
                   
                    Image(systemName: viewModel.chooseMonitor.balance ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundStyle(viewModel.chooseMonitor.balance ? .green : .red)
                        .offset(x: 130)
                }
                TextPlaneView(placeHolder: "Engine temperature", text: String(viewModel.chooseMonitor.engineTemperature) + "°")
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
                viewModel.deleteMonitor(monitor: viewModel.chooseMonitor)
                dismiss()
            }))
        })
        
        //MARK: - ToolBar
        .toolbar(content: {
            ToolbarItem(placement: .automatic) {
                HStack {
                    NavigationLink {
                        EditeMonitorView(viewModel: viewModel)
                    } label: {
                        Image(systemName: "pencil")
                    }

                    
                    Button(action: {showAlert = true}, label: {
                        Image(systemName: "trash.fill")
                    })
                }
            }
        })
        
    }
}

//#Preview {
//    MonitorParametrsView()
//}
