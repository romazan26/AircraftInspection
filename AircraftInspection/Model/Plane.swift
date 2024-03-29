//
//  Plane.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation

struct Plane: Identifiable {
    let id = UUID()
    let name: String
    let model: String
    let serialNumber: String
    let lastInspection: Date
    let upcominInspection: Date
}
