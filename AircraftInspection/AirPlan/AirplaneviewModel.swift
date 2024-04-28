//
//  AirplaneviewModel.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import Foundation
import SwiftUI
import CoreData


final class AirplaneviewModel: ObservableObject {
    
    //  @Published var planes: [Plane] = []
    @Published var choosPlane: PlanesCD!
    @Published var planes: [PlanesCD] = []
    
    @Published var simpleName = ""
    @Published var simpleModel = ""
    @Published var simpleSerialNumber = ""
    @Published var simpleLastInspection = ""
    @Published var simpleUpcomingInspection = ""
    
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
        let request = NSFetchRequest<PlanesCD>(entityName: "PlanesCD")
        
        do {
            planes = try container.viewContext.fetch(request)
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
    
    //MARK: - ADD Plane
    func addPlane() {
        let newPlane = PlanesCD(context: container.viewContext)
        newPlane.id = UUID()
        newPlane.name = simpleName
        newPlane.model = simpleModel
        newPlane.serialNumber = simpleSerialNumber
        newPlane.lastInspection = simpleLastInspection
        newPlane.upcominInspection = simpleUpcomingInspection
        
        saveDate()
        
        simpleName = ""
        simpleModel = ""
        simpleSerialNumber = ""
        simpleLastInspection = ""
        simpleUpcomingInspection = ""
    }
    //MARK: - DELETE
    func deletePlane(plane: PlanesCD) {
        container.viewContext.delete(plane)
        saveDate()
    }
    
    func fillChosePlane(){
        simpleName = choosPlane.name ?? ""
        simpleModel = choosPlane.model ?? ""
        simpleSerialNumber = choosPlane.serialNumber ?? ""
        simpleLastInspection = choosPlane.lastInspection ?? ""
        simpleUpcomingInspection = choosPlane.upcominInspection ?? ""
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
                saveDate()
            }
            index += 1
        }
        
    }
}
