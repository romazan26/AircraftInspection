//
//  ContentView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct TabViewBoot: View {
    var body: some View {
        TabView {
            AirplanView().tabItem {Label("Airplan", systemImage: "airplane")}
            MonitoringView().tabItem { Label("Monitoring", systemImage: "gearshape.2.fill") }
            FligtsView().tabItem { Label("Flights", systemImage: "airplane.departure") }
            AnalyticsView().tabItem { Label("Analytics", systemImage: "doc.plaintext.fill") }
        }
    }
}

#Preview {
    TabViewBoot()
}
