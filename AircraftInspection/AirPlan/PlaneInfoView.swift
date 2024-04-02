//
//  PlaneInfoView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct PlaneInfoView: View {
    var plane: Plane
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            VStack {
                Text(plane.name)
                    .font(.largeTitle)
                    .bold()
                Text(plane.model)
                Image(.airplane)
                    .resizable()
                    .frame(width: 300,height: 92)
                
            }
            Spacer()
            Text("About the plane")
            TextPlaneView(placeHolder: "Model", text: plane.model)
            TextPlaneView(placeHolder: "Serial number", text: plane.serialNumber)
            TextPlaneView(placeHolder: "Last inspection", text: plane.lastInspection)
            TextPlaneView(placeHolder: "Upcoming inspection", text: plane.upcominInspection)
        }
        .toolbar(content: {
            ToolbarItem(placement: .automatic) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "pencil")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "trash.fill")
                    })
                }
            }
        })
    }
}

#Preview {
    PlaneInfoView(plane: DataManager.shared.createTempData()[0])
}
