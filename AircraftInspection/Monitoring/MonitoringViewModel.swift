//
//  MonitoringViewModel.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import Foundation

final class MonitoringViewModel: ObservableObject {
    
    @Published var monitors: [Monitoring] = DataManager.shared.createTempDataMonitor()
    @Published var chooseMonitor: Monitoring!
    
    @Published var simplename = ""
    @Published var simpleweight = ""
    @Published var simpleengineTemperature = ""
    @Published var simpleairPressure = ""
    @Published var simplefuelConsumption = ""
    @Published var simplebalance = false
    
    
    func deleteMonitor(){
        print(monitors)
        monitors.removeAll { monitoring in
            monitoring.id == chooseMonitor.id
        }
        print("monitorId: \(chooseMonitor.id)")
        print(monitors)
    }
    
    func addmonitor(){
        let monitor = Monitoring(name: simplename,
                                 weight: Int(simpleweight) ?? 0,
                                 engineTemperature: Int(simpleengineTemperature) ?? 0,
                                 airPressure: Int(simpleairPressure) ?? 0,
                                 fuelConsumption: Float(simplefuelConsumption) ?? 0.0,
                                 balance: simplebalance)
        monitors.append(monitor)
        
        simplename = ""
        simpleweight = ""
        simpleengineTemperature = ""
        simpleairPressure = ""
        simplefuelConsumption = ""
        simplebalance = false
    }
}
