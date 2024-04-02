//
//  MonitorCellView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct MonitorCellView: View {
    let monitor: Monitoring
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.cellBackground)
                .frame(width: 340, height: 89)
                .offset(x: -20)
            HStack(spacing: 30) {
                Image(systemName: "gearshape.2.fill")
                    .resizable()
                    .frame(width: 37, height: 30)
                    .foregroundStyle(.white)
                Rectangle()
                    .frame(width: 1, height: 41)
                    .foregroundStyle(.gray)
                
                    Text(monitor.name)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
     
                ZStack {
                    Circle()
                        .frame(width: 31,height: 31)
                        .foregroundStyle(.white)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                        .bold()
                }
            }.padding()
            
        }.padding(8)
    }
}

#Preview {
    MonitorCellView(monitor: DataManager.shared.createTempDataMonitor()[0])
}
