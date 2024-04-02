//
//  AddPlaneView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct AddPlaneView: View {
    @ObservedObject var viewModel: AirplaneviewModel
    @Environment(\.dismiss) var dismiss
    
    var title = ""
    
    var body: some View {
        VStack {
            TextFieldPlaneView(placeHolder: "Name", text: $viewModel.simpleName)
            TextFieldPlaneView(placeHolder: "Model", text: $viewModel.simpleModel)
            TextFieldPlaneView(placeHolder: "Serial number", text: $viewModel.simpleSerialNumber)
            TextFieldPlaneView(placeHolder: "Last inspection", text: $viewModel.simpleLastInspection)
            TextFieldPlaneView(placeHolder: "Upcoming inspection", text: $viewModel.simpleUpcomingInspection)
            Spacer()
            Button(action: {
                if title == "Add plane" {
                    viewModel.addPlane()
                } else {
                    
                }
                
                dismiss()
            }, label: {
                Text("SAVE").foregroundStyle(.black)
    
            })
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color.white)
            .cornerRadius(15)
            .padding()
            
            .navigationTitle(title)
        }
    }
}

#Preview {
    AddPlaneView(viewModel: AirplaneviewModel(planes: DataManager.shared.createTempData()))
}
