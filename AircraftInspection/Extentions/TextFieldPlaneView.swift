//
//  TextFieldPlaneView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct TextFieldPlaneView: View {
    
    @State var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(placeHolder)
                .font(.callout)
                .foregroundStyle(.gray)
            TextField("", text: $text)
                .font(.title2).font(.system(.headline))
        }
        .padding()
        .background(Color(.cellBackground))
        .cornerRadius(10)
    }
}

#Preview {
    TextFieldPlaneView(placeHolder: "Name", text: .constant("Airbus"))
}
