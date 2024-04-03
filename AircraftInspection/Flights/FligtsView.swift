//
//  FligtsView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct FligtsView: View {
    var body: some View {
        VStack {
            VStack {
                //MARK: Title
                Text("Flights").font(.title).bold()
                Text("Fill out nearest flights to check the aircraft")
                Image(.flight)
                    .resizable()
                    .frame(width: 112, height: 112)
                
                //MARK: Add Button
                //                NavigationLink(destination: AddMonitorView(viewModel: viewModel, title: "Add plane"), label: {
                //                    ButtonCircle()
                //                })
                //                .foregroundStyle(.redForApp)
                //                .offset(y: 40)
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
                Text("Nearest flights")
                    .padding(5)
                    
                ScrollView {
//                    ForEach(viewModel.monitors) { monitor in
//                        NavigationLink(destination: MonitorParametrsView(viewModel: viewModel, chooseMonitor: monitor)) {
//                            MonitorCellView(monitor: monitor)
//
//                        }
//                    }
                }
            }.padding(.top, 50)
        }.ignoresSafeArea()
    }
}

#Preview {
    FligtsView()
}
