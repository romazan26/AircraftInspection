//
//  AirplaneCellView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct AirplaneCellView: View {
    let airplane: Plane
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.cellBackground)
                .frame(width: 360, height: 108)
                .offset(x: -10)
            HStack {
                Image(.airplane)
                    .resizable()
                    .frame(width: 145, height: 53)
                Rectangle()
                    .frame(width: 1, height: 41)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading) {
                    Text(airplane.name).font(.title).bold()
                    Text(airplane.model).foregroundStyle(.gray)
                }
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 31,height: 31)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                        .bold()
                }
            }
            
        }.padding(8)
    }
}

#Preview {
    AirplaneCellView(airplane: DataManager.shared.createTempData()[0])
}
