//
//  StatisticsCard.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/19/25.
//
import SwiftUI

struct StatisticsCard: View {
    let title: String
    let stats: [(String, String)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(stats, id: \.0) { stat in
                    VStack(spacing: 5) {
                        Text(stat.0)
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "b3e5fc"))
                        Text(stat.1)
                            .font(.title3.bold())
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
