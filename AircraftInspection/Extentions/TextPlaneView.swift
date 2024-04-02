//
//  TextPlaneView.swift
//  AircraftInspection
//
//  Created by Роман on 02.04.2024.
//

import SwiftUI

struct TextPlaneView: View {
    
    @State var placeHolder: String
    @State var text: String
    
    var body: some View {
  
        HStack {
            VStack(alignment: .leading) {
                Text(placeHolder)
                    .font(.callout)
                    .foregroundStyle(.gray)
                Text(text)
                    .font(.title2).bold()
                    
                
            }
            .padding()
            
            Spacer()
        }.frame(width: 335, height: 89)
            .background(Color(.cellBackground))
        .cornerRadius(10)
        
    }
}

#Preview {
    TextPlaneView(placeHolder: "Model", text: "Qatar Airways")
}
