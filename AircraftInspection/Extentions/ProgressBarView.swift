//
//  ProgressBarView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct ProgressBarView: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percents: CGFloat = 79
    
    var body: some View {
        let multiplayer = width / 100
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundStyle(.gray)
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percents * multiplayer, height: height)
                .foregroundStyle(.redForApp)
          
        }
    }
}

#Preview {
    ProgressBarView()
}
