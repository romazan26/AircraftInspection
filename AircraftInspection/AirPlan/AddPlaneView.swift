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
    @FocusState private var keyboardIsFocused: Bool
    
    var title = ""
    
    
    var body: some View {
        VStack {
            TextFieldPlaneView(placeHolder: "Name", text: $viewModel.simpleName)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Model", text: $viewModel.simpleModel)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Serial number", text: $viewModel.simpleSerialNumber)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Last inspection", text: $viewModel.simpleLastInspection)
                .focused($keyboardIsFocused)
            TextFieldPlaneView(placeHolder: "Upcoming inspection", text: $viewModel.simpleUpcomingInspection)
                .focused($keyboardIsFocused)
            Spacer()
            
            //MARK: - Save Button
            Button(action: {
                if title == "Add plane" {
                    viewModel.addPlane()
                } else {
                    viewModel.replaceInfoPlane()
                }
                dismiss()
            }, label: {
                Text("SAVE").foregroundStyle(.black)
                
            })
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color.white)
            .cornerRadius(15)
            
            .navigationTitle(title)
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
        .padding()
        .onAppear(perform: {
            if title == "Edit" {
                viewModel.fillChosePlane()
            }
        })
    }
}

#Preview {
    AddPlaneView(viewModel: AirplaneviewModel())
}
