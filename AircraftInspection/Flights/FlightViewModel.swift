//
//  FlightViewModel.swift
//  AircraftInspection
//
//  Created by Роман on 04.04.2024.
//

import Foundation
import CoreData

final class FlightViewModel: ObservableObject {
    
    @Published var flights: [Flight] = []
    
    @Published var chooseFlight: Flight!
    @Published var simpleName = ""
    @Published var simpleDate =  "19 Jun 2024"
    @Published var simpleSystemAndComponents = false
    @Published var simpleElectronicsAndAvionics = false
    @Published var simpleIdentificationAndCertification = false
    @Published var simleNote = ""
    
    //MARK: - CoreData
    let container = NSPersistentContainer(name: "Aircraft")
    
    init() {
        container.loadPersistentStores { descriptoin , error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
        fetchFlight()
    }
    
    func fetchFlight() {
        let request = NSFetchRequest<Flight>(entityName: "Flight")
        
        do {
            flights = try container.viewContext.fetch(request)
            print("Fetch date")
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func saveDate() {
        do {
            try container.viewContext.save()
            fetchFlight()
        }catch let error {
            print("error save data \(error)")
        }
    }
    
    func dateFormated(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone.current
        
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    //MARK: - AddFlight
    func addFlight() {
        
        let newFlight = Flight(context: container.viewContext)
        newFlight.id = UUID()
        newFlight.name = simpleName
        newFlight.dateOfVertification = simpleDate
        newFlight.electronicsAndAvoinics = simpleElectronicsAndAvionics
        newFlight.identificationAndCertification = simpleIdentificationAndCertification
        newFlight.note = simleNote
        
        saveDate()
        clear()
    }
    func replaceFlight() {
        var index = 0
        for flight in flights  {
            if flight.id == chooseFlight.id{
                flights[index].dateOfVertification = simpleDate
                flights[index].systemsOfComponents = simpleSystemAndComponents
                flights[index].electronicsAndAvoinics = simpleElectronicsAndAvionics
                flights[index].identificationAndCertification = simpleIdentificationAndCertification
                flights[index].note = simleNote
                saveDate()
            }
            index += 1
        }
        clear()
    }
    func fillChooseFlight() {
        simpleSystemAndComponents = chooseFlight.systemsOfComponents
        simpleElectronicsAndAvionics = chooseFlight.electronicsAndAvoinics
        simpleIdentificationAndCertification = chooseFlight.identificationAndCertification
        simleNote = chooseFlight.note ?? ""
    }
    func deleteFlight(flight: Flight) {
        container.viewContext.delete(flight)
        saveDate()
    }
    private func clear() {
        simpleName = ""
        simpleDate = ""
        simpleSystemAndComponents = false
        simpleElectronicsAndAvionics = false
        simpleIdentificationAndCertification = false
        simleNote = ""
    }
}
