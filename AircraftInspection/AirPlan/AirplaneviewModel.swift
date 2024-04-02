//
//  AirplaneviewModel.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation

final class AirplaneviewModel: ObservableObject {
    
    @Published var planes: [Plane] = DataManager.shared.createTempData()
    @Published var choosPlane: Plane!
    
    @Published var simpleName = ""
    @Published var simpleModel = ""
    @Published var simpleSerialNumber = ""
    @Published var simpleLastInspection = ""
    @Published var simpleUpcomingInspection = ""
    
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
    
    func fillChosePlane(){
        simpleName = choosPlane.name
        simpleModel = choosPlane.model
        simpleSerialNumber = choosPlane.serialNumber
        simpleLastInspection = choosPlane.lastInspection
        simpleUpcomingInspection = choosPlane.upcominInspection
    }
    
    func replaceInfoPlane(){
        var index = 0
        for plane in planes {
            if plane.id == choosPlane.id{
                planes[index].name = simpleName
                planes[index].model = simpleModel
                planes[index].serialNumber = simpleSerialNumber
                planes[index].lastInspection = simpleLastInspection
                planes[index].upcominInspection = simpleUpcomingInspection
            }
            index += 1
        }
    }
}
