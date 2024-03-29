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
                          lastInspection: Date.now,
                          upcominInspection: Date.now)
        planes.append(plane)
        
        return planes
    }
}

