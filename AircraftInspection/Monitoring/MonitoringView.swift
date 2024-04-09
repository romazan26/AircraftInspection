//
//  MonitoringView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct MonitoringView: View {
    
    @ObservedObject var viewModel = MonitoringViewModel()
    @State private var showingConfirmation = false
    
    var body: some View {
        
        
        VStack {
            VStack {
                //MARK: Title
                
                HStack {
                    Spacer()
                    Text("Monitoring").font(.title).bold()
                    Spacer()
                    Button {
                        showingConfirmation = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundStyle(.redForApp)
                    }

                }.padding(.horizontal)
                Text("Track all aircraft parameters")
                Image(.monitoring)
                    .resizable()
                    .frame(width: 104, height: 104)
                
                //MARK: Add Button
                NavigationLink(destination: AddMonitorView(viewModel: viewModel, title: "Add plane"), label: {
                    ButtonCircle()
                })
                .foregroundStyle(.redForApp)
                .offset(y: 40)
            }
            .foregroundStyle(.black)
            .padding(.top, 86)
            .background {
                Color(.white)
                    .frame(width: 393, height: 338)
                    .cornerRadius(10)
        }
            
            
            
            //MARK: - Planes
            VStack(alignment: .leading) {
                Text("Your planes")
                    .padding(5)
                    .padding(.top, 20)
                ScrollView {
                    ForEach(viewModel.monitors) { monitor in
                        NavigationLink(destination: MonitorParametrsView(viewModel: viewModel, chooseMonitor: monitor)) {
                            MonitorCellView(monitor: monitor)

                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingConfirmation, content: {
            SettingsView()
                .presentationDetents([.medium])
        })
        .ignoresSafeArea()
    }
}

#Preview {
    MonitoringView()
}
