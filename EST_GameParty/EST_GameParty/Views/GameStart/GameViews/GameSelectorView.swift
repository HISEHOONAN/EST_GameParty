//
//  GameSelectorView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//


import SwiftUI

// 새로운 뷰 추가:
struct GameSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedGame: GameType?
    @State private var showGameView = false
    
    enum GameType: String, CaseIterable {
        case numberBaseball = "숫자야구"
        case comingSoon1 = "곧 출시될 게임 1"
        case comingSoon2 = "곧 출시될 게임 2"
        
        var icon: String {
            switch self {
            case .numberBaseball: return "number.circle.fill"
            case .comingSoon1: return "lock.fill"
            case .comingSoon2: return "lock.fill"
            }
        }
        
        var description: String {
            switch self {
            case .numberBaseball: return "3자리 숫자를 맞추는 두뇌 게임"
            case .comingSoon1: return "새로운 게임이 곧 출시됩니다"
            case .comingSoon2: return "새로운 게임이 곧 출시됩니다"
            }
        }
        
        var isAvailable: Bool {
            self == .numberBaseball
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 배경 그라데이션
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
                        
                        Text("게임 선택")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        // 균형을 위한 빈 공간
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.clear)
                    }
                    .padding()
                    
                    // 게임 목록
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(GameType.allCases, id: \.self) { game in
                                NavigationLink(
                                    destination: game == .numberBaseball ? AnyView(NumberBaseballGameView()) : AnyView(EmptyView()),
                                    isActive: Binding(
                                        get: { selectedGame == game },
                                        set: { if $0 { selectedGame = game } }
                                    )
                                ) {
                                    GameCard(game: game)
                                }
                                .disabled(!game.isAvailable)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
