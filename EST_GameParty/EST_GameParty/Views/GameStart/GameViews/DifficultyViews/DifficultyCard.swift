//
//  DifficultyCard.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//

import SwiftUI

struct DifficultyCard: View {
    
    let difficulty: DifficultySelector.Difficulty
    
    var body: some View {
        HStack {
            Image(systemName: difficulty.icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(
                    LinearGradient(gradient: Gradient(colors: difficulty.color),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(difficulty.rawValue)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                Text(difficulty.description)
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "b3e5fc"))
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .font(.title3)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

