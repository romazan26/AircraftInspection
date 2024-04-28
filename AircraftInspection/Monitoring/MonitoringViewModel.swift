//
//  MonitoringViewModel.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import Foundation

final class MonitoringViewModel: ObservableObject {
    
    @Published var monitors: [Monitoring] = []
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
    
    func fillChooseMonitor() {
        simplename = chooseMonitor.name
        simpleweight = String(chooseMonitor.weight)
        simpleengineTemperature = String(chooseMonitor.engineTemperature)
        simpleairPressure = String(chooseMonitor.airPressure)
        simplefuelConsumption = String(chooseMonitor.fuelConsumption)
        simplebalance = chooseMonitor.balance
    }
    
    func replaceMonitor() {
        var index = 0
        for monitor in monitors {
            if monitor.id == chooseMonitor.id{
                monitors[index].name = simplename
                monitors[index].weight = Int(simpleweight) ?? 0
                monitors[index].airPressure = Int(simpleairPressure) ?? 0
                monitors[index].engineTemperature = Int(simpleengineTemperature) ?? 0
                monitors[index].fuelConsumption = Float(simplefuelConsumption) ?? 0
                monitors[index].balance = simplebalance
            }
            index += 1
        }
    }
}
