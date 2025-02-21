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
    
    // 샘플 순위 데이터
    let MOCK_RANKINGS: [String: [RankingItem]] = [  // 난이도별 순위 데이터를 딕셔너리 형태로 저장
        "3": [
            RankingItem(id: 1, name: "Player1", tries: 4, time: "00:45"), // 1위
            RankingItem(id: 2, name: "Player2", tries: 5, time: "01:02"), // 2위
            RankingItem(id: 3, name: "Player3", tries: 6, time: "01:15"), // 3위
        ],
        "4": [
            RankingItem(id: 1, name: "Player4", tries: 4, time: "01:30"), // 1위
            RankingItem(id: 2, name: "Player5", tries: 5, time: "01:45"), // 2위
            RankingItem(id: 3, name: "Player6", tries: 6, time: "02:00"), // 3위
        ],
        "5": [
            RankingItem(id: 1, name: "Player7", tries: 4, time: "02:15"), // 1위
            RankingItem(id: 2, name: "Player8", tries: 5, time: "02:30"), // 2위
            RankingItem(id: 3, name: "Player9", tries: 6, time: "02:45"), // 3위
        ],
    ]
    
    
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
