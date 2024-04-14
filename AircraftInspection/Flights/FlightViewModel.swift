//
//  FlightViewModel.swift
//  AircraftInspection
//
//  Created by Роман on 04.04.2024.
//

import Foundation

final class FlightViewModel: ObservableObject {
    
    @Published var flights: [Flight] = DataManager.shared.createTempDataFlight()
    
    @Published var chooseFlight: Flight!
    @Published var simpleName = ""
    @Published var simpleDate =  "19 Jun 2024"
    @Published var simpleSystemAndComponents = false
    @Published var simpleElectronicsAndAvionics = false
    @Published var simpleIdentificationAndCertification = false
    @Published var simleNote = ""
    
    func dateFormated(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone.current
        
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    func addFlight() {
        let fligh = Flight(name: simpleName,
                           dateOfVertification: simpleDate,
                           systemsOfComponents: simpleSystemAndComponents,
                           electronicsAndAvoinics: simpleElectronicsAndAvionics,
                           identificationAndCertification: simpleIdentificationAndCertification,
                           note: simleNote)
        flights.append(fligh)
       
        simpleName = ""
        simpleDate = ""
        simpleSystemAndComponents = false
        simpleElectronicsAndAvionics = false
        simpleIdentificationAndCertification = false
        simleNote = ""
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
            }
            index += 1
        }
    }
    func fillChooseFlight() {
        simpleSystemAndComponents = chooseFlight.systemsOfComponents
        simpleElectronicsAndAvionics = chooseFlight.electronicsAndAvoinics
        simpleIdentificationAndCertification = chooseFlight.identificationAndCertification
        simleNote = chooseFlight.note
    }
    func deleteFlight(flightId: UUID) {
        flights.removeAll { flight in
            flight.id == flightId
        }
    }
}
