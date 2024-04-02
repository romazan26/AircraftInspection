//
//  MonitoringView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct MonitoringView: View {
    @ObservedObject var viewModel = MonitoringViewModel()
    var body: some View {
        
        
        VStack {
            VStack {
                //MARK: Title
                Text("Monitoring").font(.title).bold()
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
                        NavigationLink(destination: MonitorParametrsView(viewModel: viewModel)) {
                            MonitorCellView(monitor: monitor)
                                .onAppear {
                                    viewModel.chooseMonitor = monitor
                                }           
                        }
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    MonitoringView()
}
