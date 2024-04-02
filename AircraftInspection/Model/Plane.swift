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
