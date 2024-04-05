//
//  AnalyticCellView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct AnalyticCellView: View {
    let flight: Flight
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 370, height: 89)
                .foregroundStyle(.cellBackground)
            VStack(alignment: .leading, spacing: 10) {
                Text("Report from the \(flight.dateOfVertification)")
                Text(flight.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
            }.padding()
        }
    }
}

#Preview {
    AnalyticCellView(flight: DataManager.shared.createTempDataFlight()[0])
}
