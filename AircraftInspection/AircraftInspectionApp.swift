//
//  AircraftInspectionApp.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

@main
struct AircraftInspectionApp: App {
    
    @AppStorage("isFirstStart") var isFirstStart: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isFirstStart {
                TabViewBoot().preferredColorScheme(.dark)
            }else {
                IntroView().preferredColorScheme(.dark)
            }
            
        }
    }
}
