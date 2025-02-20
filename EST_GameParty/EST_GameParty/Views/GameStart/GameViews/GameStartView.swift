//
//  GameStartView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct GameStartView: View {
    @State private var showGameSelector = false

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
                        HStack(spacing: 8) {
                            Image(systemName: "gamecontroller.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("EST GameParty")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .padding(.trailing)
                        }
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    // 게임 로고 이미지
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.1))
                        .frame(width: 300, height: 200)
                        .overlay(
                            Image("estsoft")
                                .resizable()
                                .scaledToFit()
                                .padding(20)
                                .foregroundColor(.clear)
                                
                                
                        )
                        .shadow(radius: 10)
                    
                    // 게임 제목
                    VStack(spacing: 8) {
                        Text("게임 파티!")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("The Game PartyPack")
                            .font(.title3)
                            .foregroundColor(Color(hex: "b3e5fc"))
                    }
                    .padding(.vertical, 40)
                    
                    // 버튼
                    VStack(spacing: 16) {
                        Button(action: { showGameSelector = true }) {
                            CustomButton(
                                title: "게임 시작",
                                icon: "play.circle.fill",
                                colors: [Color(hex: "00b0ff"), Color(hex: "2979ff")]
                            )
                        }
                        .sheet(isPresented: $showGameSelector) {
                            GameSelectorView()
                        }
                        
                        NavigationLink(destination: NoticeView()) {
                            CustomButton(
                                title: "공지사항",
                                icon: "bell.fill",
                                colors: [Color(hex: "7c4dff"), Color(hex: "651fff")]
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    GameStartView()
}
