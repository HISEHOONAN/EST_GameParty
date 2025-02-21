//
//  RankingRow.swift
//  EST_GameParty
//
//  Created by 윤태한 on 2/20/25.
//

import SwiftUI

// MARK: - RankingRow View
struct RankingRow: View {
    let index: Int
    let item: RankingItem
    
    var body: some View {
        HStack(spacing: 16) {
            VStack {
                Text("\(index + 1)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                if index == 0 {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: "FFD700"))
                }
            }
            .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                HStack {
                    Text("시도: \(item.tries)회")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("시간: \(item.time)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(16)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color(white: 0.95)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
    }
}
