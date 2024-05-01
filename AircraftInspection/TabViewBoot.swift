//
//  ContentView.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI


struct TabViewBoot: View {
    
   
    @ObservedObject var flightViewModel = FlightViewModel()
    @ObservedObject var airplaneViewModel = AirplaneviewModel()
    var body: some View {
        
        
        NavigationView {
            TabView {
                
                AirplanView(viewModel: airplaneViewModel).tabItem {Label("Airplan", systemImage: "airplane")}
                MonitoringView().tabItem { Label("Monitoring", systemImage: "gearshape.2.fill") }
                FligtsView(viewModel: flightViewModel).tabItem { Label("Flights", systemImage: "airplane.departure") }
                AnalyticsView(viewModel: flightViewModel).tabItem { Label("Analytics", systemImage: "doc.plaintext.fill") }
            }
        }.accentColor(.redForApp)
    }
}

#Preview {
    TabViewBoot()
}
