//
//  AirplaneviewModel.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation

final class AirplaneviewModel: ObservableObject {
    
    @Published var planes: [Plane]
    
    @Published var simpleName = ""
    @Published var simpleModel = ""
    @Published var simpleSerialNumber = ""
    @Published var simpleLastInspection = ""
    @Published var simpleUpcomingInspection = ""
    
    
    init(planes: [Plane]) {
        self.planes = planes
    }
    
    func addPlane() {
        let plane = Plane(name: simpleName,
                          model: simpleModel,
                          serialNumber: simpleSerialNumber,
                          lastInspection: simpleLastInspection,
                          upcominInspection: simpleUpcomingInspection)
        
        planes.append(plane)
        
        simpleName = ""
        simpleModel = ""
        simpleSerialNumber = ""
        simpleLastInspection = ""
        simpleUpcomingInspection = ""
    }
    
    func deletePlane(planeId: UUID) {
        planes.removeAll { plane in
            plane.id == planeId
        }
    }
}
