//
//  AchievementsCard.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/19/25.
//

import SwiftUI


struct AchievementsCard: View {
    let achievements = [
        ("trophy.fill", "첫 승리", "첫 게임 승리 달성"),
        ("flame.fill", "3연승", "3연승 달성"),
        ("star.fill", "스피드스타", "1분 내 승리")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("업적")
                .font(.headline)
                .foregroundColor(.white)
            
            ForEach(achievements, id: \.0) { achievement in
                HStack(spacing: 15) {
                    Image(systemName: achievement.0)
                        .foregroundColor(Color(hex: "ffd700"))
                        .font(.title3)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(achievement.1)
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                        
                        Text(achievement.2)
                            .font(.caption)
                            .foregroundColor(Color(hex: "b3e5fc"))
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
