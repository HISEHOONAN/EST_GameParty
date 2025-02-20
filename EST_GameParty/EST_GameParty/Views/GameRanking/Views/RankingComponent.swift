//
//  RankingComponent.swift
//  EST_GameParty
//
//  Created by 윤태한 on 2/20/25.
//


import SwiftUI

// MARK: - RankingComponent View
struct RankingComponent: View {
    @State private var selectedDifficulty: String = "3"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("숫자야구 랭킹")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                HStack {
                    ForEach(DIFFICULTY_LEVELS) { level in
                        Button(action: {
                            selectedDifficulty = level.id
                        }) {
                            Text(level.name)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .foregroundColor(selectedDifficulty == level.id ? .white : .black)
                                .background(selectedDifficulty == level.id ? level.color : Color.clear)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(4)
                .background(Color.white)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                ScrollView {
                    VStack(spacing: 12) {
                        if let rankings = MOCK_RANKINGS[selectedDifficulty] {
                            ForEach(Array(rankings.enumerated()), id: \.element.id) { index, item in
                                RankingRow(index: index, item: item)
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                }
                
                Spacer()
            }
            .padding(16)
        }
    }
}

#Preview {
    RankingComponent()
}
