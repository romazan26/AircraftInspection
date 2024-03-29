//
//  AirplaneviewModel.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation

final class AirplaneviewModel: ObservableObject {
    @Published var planes: [Plane]
    
    init() {
        self.planes = DataManager.shared.createTempData()
    }
}
