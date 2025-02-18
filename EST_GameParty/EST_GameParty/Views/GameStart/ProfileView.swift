//
//  ProfileView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // 타이틀
                Text("마이 페이지")
                    .font(.largeTitle)
                    .padding()
                
                // 프로필 정보
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 100)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    HStack() {
                        Text("닉네임")
                            .font(.title2)
                        
                        Text("사용자123")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                // 리스트 항목들 (배경색 제거)
                List {
                    NavigationLink("설정", destination: Text("설정 화면"))
                    NavigationLink("로그아웃", destination: Text("로그아웃 확인"))
                }
                .scrollContentBackground(.hidden) // 리스트 배경 제거
                .background(Color.clear) // 리스트 주변 배경도 제거
                .frame(maxHeight: .infinity)
            }
            .background(Color.white) // 전체 배경 설정
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
