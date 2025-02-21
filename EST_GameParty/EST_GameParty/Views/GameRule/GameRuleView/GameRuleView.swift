//  RuleItemView.swift
//  EST_GameParty
//
//  Created by 원대한 on 2/20/25.
//

import SwiftUI


struct GameRuleView: View {
    
    @State private var showAnimationView = false
    
    var body: some View {
        ZStack {
            
            
            LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                         startPoint: .top,
                         endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                if showAnimationView {
                    // 애니메이션 타이틀 표시
                    TitleAnimationView()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20) 
                        .padding()
                } else {
                
                    Button(action: {
                        // 버튼 클릭시 부드러운 애니메이션과 함께 상태 변경
                        withAnimation(.easeInOut) {
                            showAnimationView = true
                        }
                    }) {
                        VStack(spacing: 20) {
                            // 게임 방법 보기 카드 디자인
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 300, height: 200)
                                .overlay(
                                    VStack(spacing: 16) {
                                        // 물음표 아이콘
                                        Image(systemName: "questionmark.circle.fill")
                                            .font(.system(size: 80))
                                            .foregroundColor(.white)
                                        
                                        // 게임방법 텍스트
                                        Text("게임방법 보기")
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                    }
                                )
                                .shadow(radius: 10)
                            
                            // 시작 버튼 디자인
                            HStack {
                                
                                Image(systemName: "play.circle.fill")
                                    .font(.title2)
                                
                                Text("터치하여 시작")
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(Color(hex: "b3e5fc"))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(
                                
                                LinearGradient(
                                    colors: [Color(hex: "7c4dff"), Color(hex: "651fff")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(25)
                            .shadow(radius: 5)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }
}

// Xcode 프리뷰 설정
#Preview {
    GameRuleView()
}

