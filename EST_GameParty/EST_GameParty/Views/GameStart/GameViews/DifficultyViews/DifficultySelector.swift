//
//  DifficultySelector.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//

import SwiftUI

struct DifficultySelector: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedDifficulty: Difficulty?
    
    enum Difficulty: String, CaseIterable {
        case easy = "하"
        case medium = "중"
        case hard = "상"
        
        var description: String {
            switch self {
            case .easy: return "3자리 숫자"
            case .medium: return "4자리 숫자"
            case .hard: return "5자리 숫자"
            }
        }
        
        var digitCount: Int {
            switch self {
            case .easy: return 3
            case .medium: return 4
            case .hard: return 5
            }
        }
        
        var icon: String {
            switch self {
            case .easy: return "1.circle.fill"
            case .medium: return "2.circle.fill"
            case .hard: return "3.circle.fill"
            }
        }
        
        var color: [Color] {
            switch self {
            case .easy: return [Color(hex: "4CAF50"), Color(hex: "2E7D32")]
            case .medium: return [Color(hex: "FF9800"), Color(hex: "F57C00")]
            case .hard: return [Color(hex: "F44336"), Color(hex: "C62828")]
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // 헤더
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("난이도 선택")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.clear)
                    }
                    .padding()
                    
                    Text("원하시는 난이도를 선택해주세요")
                        .font(.title3)
                        .foregroundColor(Color(hex: "b3e5fc"))
                        .padding(.top, 30)
                    
                    // 🔹 난이도 카드 리스트 추가
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                                NavigationLink(destination: NumberBaseballGameView(difficulty: difficulty)) {
                                    DifficultyCard(difficulty: difficulty)
                                        .contentShape(Rectangle()) // 터치 영역 확장
                                }
                            }
                        }
                        .padding()
                        .navigationBarBackButtonHidden()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
