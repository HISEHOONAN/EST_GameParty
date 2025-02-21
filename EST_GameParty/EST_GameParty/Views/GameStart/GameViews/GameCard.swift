//
//  GameCard.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//

import SwiftUI

struct GameCard: View {
    
    let game: GameSelectorView.GameType
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: game.icon)
                .font(.system(size: 40))
                .foregroundColor(game.isAvailable ? .white : .gray)
                .frame(width: 60, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white.opacity(0.15))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(game.rawValue)
                    .font(.title3.bold())
                    .foregroundColor(game.isAvailable ? .white : .gray)
                
                Text(game.description)
                    .font(.subheadline)
                    .foregroundColor(game.isAvailable ? Color(hex: "b3e5fc") : .gray)
            }
            
            Spacer()
            
            Image(systemName: game.isAvailable ? "chevron.right" : "lock.fill")
                .foregroundColor(game.isAvailable ? .white : .gray)
                .font(.title3)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
