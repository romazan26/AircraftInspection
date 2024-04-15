//
//  FlightChekingView.swift
//  AircraftInspection
//
//  Created by Роман on 04.04.2024.
//

import SwiftUI

struct FlightChekingView: View {
    
    @ObservedObject var viewModel: FlightViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var keyboardIsFocused: Bool
    
    
    var body: some View {
        VStack{
            Text(viewModel.chooseFlight.name)
                .font(.largeTitle)
                .bold()
            HStack{
                Text("Date of vertification").foregroundStyle(.gray)
                Spacer()
                TextField("", text: $viewModel.simpleDate)
                    .padding()
                    .frame(width: 113, height: 40)
                    .background(Color.cellBackground)
                    .cornerRadius(10)
                    .minimumScaleFactor(0.7)
                    .focused($keyboardIsFocused)
            }
            Rectangle()
                .frame(width: 357, height: 1)
                .foregroundStyle(.gray)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Systems and components")
                    .offset(x: -40)
                HStack(spacing: 25){
                    ButtonChooseView(action: {
                        viewModel.simpleSystemAndComponents = true
                    }, choose: viewModel.simpleSystemAndComponents, title: "Good")
                    ButtonChooseView(action: {
                        viewModel.simpleSystemAndComponents = false
                    }, choose: !viewModel.simpleSystemAndComponents, title: "Violated")
                }
            }
            VStack(alignment: .leading, spacing: 20){
                Text("Electronics and avionics")
                    .offset(x: -40)
                HStack(spacing: 25){
                    ButtonChooseView(action: {
                        viewModel.simpleElectronicsAndAvionics = true
                    }, choose: viewModel.simpleElectronicsAndAvionics, title: "Good")
                    ButtonChooseView(action: {
                        viewModel.simpleElectronicsAndAvionics = false
                    }, choose: !viewModel.simpleElectronicsAndAvionics, title: "Violated")
                }
            }
            VStack(alignment: .leading, spacing: 20){
                Text("Identification and certification")
                    .offset(x: -40)
                HStack(spacing: 25){
                    ButtonChooseView(action: {
                        viewModel.simpleIdentificationAndCertification = true
                    }, choose: viewModel.simpleIdentificationAndCertification, title: "Good")
                    ButtonChooseView(action: {
                        viewModel.simpleIdentificationAndCertification = false
                    }, choose: !viewModel.simpleIdentificationAndCertification, title: "Violated")
                }
            }
            
            Spacer()
            TextFieldPlaneView(placeHolder: "Note", text: $viewModel.simleNote)
                .focused($keyboardIsFocused)
            
            //MARK: - Save Button
            Button(action: {
                viewModel.replaceFlight()
                dismiss()
            }, label: {
                Text("ADD").foregroundStyle(.black)
            })
            .disabled(viewModel.simpleDate.isEmpty ? true : false)
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color (viewModel.simpleDate.isEmpty ? .gray : .white))
            .cornerRadius(15)
            
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
        .onAppear(perform: {
            viewModel.fillChooseFlight()
        })
        .padding(20)
    }
}

#Preview {
    FlightChekingView(viewModel: FlightViewModel())
}
