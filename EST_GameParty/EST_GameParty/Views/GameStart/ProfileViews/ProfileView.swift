//
//  ProfileView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - 프로필 수정
    @State private var isEditMode = false
    
    //MARK: - 사용자 정보를 위한 상태 변수들
    @State private var nickname: String = UserDefaults.standard.string(forKey: "nickname") ?? "닉네임을 설정해주세요."
    @State var totalGames = UserDefaults.standard.integer(forKey: "totalGames")
    @State private var winRate = UserDefaults.standard.integer(forKey: "winRate")
    @State private var currentStreak = UserDefaults.standard.integer(forKey: "currentStreak")
    @State private var bestRecord = "0분 0초"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("프로필")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            if isEditMode {
                                UserDefaults.standard.set(nickname, forKey: "nickname")
                            }
                            isEditMode.toggle()
                        }) {
                            Image(systemName: isEditMode ? "checkmark" : "square.and.pencil")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                        
                        if isEditMode {
                            TextField("닉네임", text: $nickname)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 200)
                                .multilineTextAlignment(.center)
                        } else {
                            Text(nickname)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(spacing: 20) {
                        StatisticsCard(title: "게임 통계", stats: [
                            ("총 게임", "\(totalGames)회"),
                            ("승률", "\(winRate)%"),
                            ("현재 연승", "\(currentStreak)연승"),
                            ("최고 기록", bestRecord)
                        ])
                        
                        RecentGamesCard()
                        
                        AchievementsCard()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ProfileView()
}
