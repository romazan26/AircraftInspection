//
//  PlaneInfoView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct PlaneInfoView: View {
    
    @ObservedObject var viewModel: AirplaneviewModel
    var plane: Plane
    @State private var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
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
            
            //MARK: - Plane Info
            Text("About the plane")
                .onAppear(perform: {
                    viewModel.choosPlane = plane
                })
            TextPlaneView(placeHolder: "Model", text: plane.model)
            TextPlaneView(placeHolder: "Serial number", text: plane.serialNumber)
            TextPlaneView(placeHolder: "Last inspection", text: plane.lastInspection)
            TextPlaneView(placeHolder: "Upcoming inspection", text: plane.upcominInspection)
        }
        
        //MARK: - ALERT
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Deletion"),
                  message: Text("Do you really want to delete it?"),
                  primaryButton: .cancel(Text("No")),
                  secondaryButton: .destructive(Text("Yes"), action: {
                viewModel.deletePlane(planeId: plane.id)
                dismiss()
            }))
        })
        
        //MARK: - ToolBar
        .toolbar(content: {
            ToolbarItem(placement: .automatic) {
                HStack {
                    NavigationLink {
                        AddPlaneView(viewModel: viewModel, title: "Edit")
                    } label: {
                        Image(systemName: "pencil")
                    }
                    
                    Button(action: {
                        showAlert = true
                    }, label: {
                        Image(systemName: "trash.fill")
                    })
                }
            }
        })
    }
}

#Preview {
    PlaneInfoView(viewModel: AirplaneviewModel(), plane: DataManager.shared.createTempData()[0])
}
