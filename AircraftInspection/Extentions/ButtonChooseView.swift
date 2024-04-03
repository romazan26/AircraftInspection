//
//  SwiftUIView.swift
//  AircraftInspection
//
//  Created by Роман on 03.04.2024.
//

import SwiftUI

struct ButtonChooseView: View {
    var action: () -> Void = {}
    var choose: Bool
    let title: String
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width: 125, height: 47)
                    .foregroundStyle(choose ? .white : .cellBackground)
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(choose ? .black : .white)
            }
        })
    }
}

#Preview {
    ButtonChooseView( choose: false, title: "Good")
}
