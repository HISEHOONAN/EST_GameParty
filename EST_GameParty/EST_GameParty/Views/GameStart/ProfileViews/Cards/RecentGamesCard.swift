//
//  RecentGamesCard.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/19/25.
//
import SwiftUI

// 최근 게임 기록 카드
struct RecentGamesCard: View {
    let recentGames = [
        ("승리", "3S 2B", "2:30"),
        ("패배", "1S 3B", "3:45"),
        ("승리", "3S 0B", "1:55"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("최근 게임")
                .font(.headline)
                .foregroundColor(.white)
            
            ForEach(recentGames, id: \.0) { game in
                HStack {
                    Circle()
                        .fill(game.0 == "승리" ? Color(hex: "00b0ff") : Color(hex: "ff1744"))
                        .frame(width: 10, height: 10)
                    
                    Text(game.0)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(game.1)
                        .foregroundColor(Color(hex: "b3e5fc"))
                    
                    Text(game.2)
                        .foregroundColor(Color(hex: "b3e5fc"))
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
