//
//  MonitoringViewModel.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import Foundation
import CoreData

final class MonitoringViewModel: ObservableObject {
    
    @Published var monitors: [Monitoring] = []
    @Published var chooseMonitor: Monitoring!
    
    @Published var simplename = ""
    @Published var simpleweight = ""
    @Published var simpleengineTemperature = ""
    @Published var simpleairPressure = ""
    @Published var simplefuelConsumption = ""
    @Published var simplebalance = false
    
    //MARK: - CoreData
    let container = NSPersistentContainer(name: "Aircraft")
    
    init() {
        container.loadPersistentStores { descriptoin , error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
        fetchPlane()
    }
    
    func fetchPlane() {
        let request = NSFetchRequest<Monitoring>(entityName: "Monitoring")
        
        do {
            monitors = try container.viewContext.fetch(request)
            print("Fetch date")
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func saveDate() {
        do {
            try container.viewContext.save()
            fetchPlane()
        }catch let error {
            print("error save data \(error)")
        }
    }
    //MARK: - Delete
    func deleteMonitor(monitor: Monitoring){
        container.viewContext.delete(monitor)
        saveDate()
    }
    
    func addmonitor(){
        let newMonitor = Monitoring(context: container.viewContext)
        newMonitor.id = UUID()
        newMonitor.name = simplename
        newMonitor.weight = Int16(simpleweight) ?? 0
        newMonitor.engineTemperature = Int16(simpleengineTemperature) ?? 0
        newMonitor.fuelConsumption = Float(simplefuelConsumption) ?? 0
        newMonitor.airPressure = Int16(simpleairPressure) ?? 0
        newMonitor.balance = simplebalance
        saveDate()
        clear()
        
    }
    
    func fillChooseMonitor() {
        simplename = chooseMonitor.name ?? ""
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
                monitors[index].weight = Int16(Int(simpleweight) ?? 0)
                monitors[index].airPressure = Int16(Int(simpleairPressure) ?? 0)
                monitors[index].engineTemperature = Int16(Int(simpleengineTemperature) ?? 0)
                monitors[index].fuelConsumption = Float(simplefuelConsumption) ?? 0
                monitors[index].balance = simplebalance
                saveDate()
            }
            index += 1
        }
        clear()
    }
    private func clear() {
        simplename = ""
        simpleweight = ""
        simpleengineTemperature = ""
        simpleairPressure = ""
        simplefuelConsumption = ""
        simplebalance = false
    }
}
