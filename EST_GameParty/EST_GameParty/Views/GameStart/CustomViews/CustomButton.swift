//
//  CustomButton.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let icon: String
    let colors: [Color]
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
            Text(title)
                .font(.title3.bold())
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(
            LinearGradient(gradient: Gradient(colors: colors),
                          startPoint: .leading,
                          endPoint: .trailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
