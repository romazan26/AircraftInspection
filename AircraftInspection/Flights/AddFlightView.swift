//
//  AddFlightView.swift
//  AircraftInspection
//
//  Created by Роман on 04.04.2024.
//

import SwiftUI

struct AddFlightView: View {
    
    @ObservedObject var viewModel: FlightViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextFieldPlaneView(placeHolder: "Name", text: $viewModel.simpleName)
            
            HStack{
                Text("Check before")
                    .foregroundStyle(.gray)
                Spacer()
                TextField("", text: $viewModel.simpleDate)
                    .padding()
                    .frame(width: 113, height: 40)
                    .background(Color.cellBackground)
                    .cornerRadius(10)
                    .minimumScaleFactor(0.7)
            }
            .padding(.vertical)
            
            Spacer()
            
            //MARK: - Save Button
            Button(action: {
                viewModel.addFlight()
                dismiss()
            }, label: {
                Text("SAVE").foregroundStyle(.black)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color.white)
            .cornerRadius(15)
            
        }.padding()
    }
}

#Preview {
    AddFlightView(viewModel: FlightViewModel())
}
