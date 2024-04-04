//
//  DataManager.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempData() -> [Plane] {
        var planes: [Plane] = []
        let plane = Plane(name: "Airbus A380",
                          model: "Qatar Airways",
                          serialNumber: "4578-662-E",
                          lastInspection: "23.02.24",
                          upcominInspection: "23.03.24")
        planes.append(plane)
        
        return planes
    }
    
    func createTempDataMonitor() -> [Monitoring] {
        var monitors: [Monitoring] = []
        let monitor = Monitoring(name: "Airbus A380",
                                 weight: 160,
                                 engineTemperature: 150,
                                 airPressure: 600,
                                 fuelConsumption: 19.1,
                                 balance: true)
        
        monitors.append(monitor)
        return monitors
    }
    
    func createTempDataFlight() -> [Flight] {
        var flights: [Flight] = []
        let flight = Flight(name: "Airbus A380",
                            dateOfVertification: "23.02.24",
                            systemsOfComponents: false,
                            electronicsAndAvoinics: true,
                            identificationAndCertification: true,
                            note: "")
        flights.append(flight)
        return flights
    }
}

