//
//  AnalyticsView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct AnalyticsView: View {
    var body: some View {
        VStack {
            
            //MARK: Title
            VStack {
                Text("Analytics").font(.title).bold()
                Text("Your reports will be displayed here")
                Image(.analitic)
                    .resizable()
                    .frame(width: 112, height: 112)
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
    AnalyticsView()
}
