//
//  Plane.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation

struct Plane: Identifiable {
    var id = UUID()
    var name: String
    var model: String
    var serialNumber: String
    var lastInspection: String
    var upcominInspection: String
}

struct Monitoring: Identifiable {
    var id = UUID()
    var name: String
    var weight: Int
    var engineTemperature: Int
    var airPressure: Int
    var fuelConsumption: Float
    var balance: Bool
}
