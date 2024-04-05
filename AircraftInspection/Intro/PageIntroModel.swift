//
//  PageIntroModel.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import Foundation

struct PageIntro: Identifiable,Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int

    static var samplePage = PageIntro(name: "Aircraft", description: "Add your aircraft for maintenance", imageUrl: "Image1", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(name: "Aircraft", description: "Add your aircraft for maintenance", imageUrl: "Image1", tag: 0),
        PageIntro(name: "Monitoring of parameters", description: "Track all aircraft parameters", imageUrl: "Image2", tag: 1),
        PageIntro(name: "Nearest flights", description: "Fill out the nearest flights to check the aircraft", imageUrl: "Image3", tag: 2)
    ]
}
