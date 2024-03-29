//
//  ButtonCircule.swift
//  AircraftInspection
//
//  Created by Роман on 29.03.2024.
//

import SwiftUI

struct ButtonCircle: View {
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                Circle().frame(width: 62, height: 62)
                Image(systemName: "plus")
                    .frame(width: 27, height: 27)
                    .foregroundStyle(.white)
            }
        })
    }
}

#Preview {
    ButtonCircle()
}
