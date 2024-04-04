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
    
    
    var body: some View {
        VStack{
            Text(viewModel.chooseFlight.name)
                .font(.largeTitle)
                .bold()
            HStack{
                Text("Date of vertification").foregroundStyle(.gray)
                Spacer()
                TextField(viewModel.chooseFlight.dateOfVertification, text: $viewModel.simpleDate)
                    .frame(width: 125, height: 47)
                    .background(Color(.cellBackground))
                    .cornerRadius(10)
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
        .onAppear(perform: {
            viewModel.fillChooseFlight()
        })
        .padding(20)
    }
}

#Preview {
    FlightChekingView(viewModel: FlightViewModel())
}
