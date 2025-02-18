//
//  ProfileButton.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct ProfileButton: View {
    
    #warning("이미지를 UserDefaults에서 가져오도록 설정 가능하게 변경 예정.")
    
    var imageName: String? = nil // 기본값 nil (설정되지 않으면 시스템 이미지 사용)
    var size: CGFloat = 80 // 기본 크기
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                if let imageName = imageName, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: "person.circle.fill") // 기본 시스템 아이콘
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray) // 기본 색상
                }
            }
            .frame(width: size, height: size)
            .clipShape(Circle()) // 원형으로 자르기
            .overlay(
                Circle().stroke(Color.white, lineWidth: 3) // 테두리 추가
            )
            .shadow(radius: 5) // 그림자 효과
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        // 사용자 이미지 설정 (profile_sample 사용)
        ProfileButton(imageName: "profile_sample", size: 100) {
            print("사용자 프로필 버튼 클릭됨")
        }
        
        // 시스템 기본 이미지 사용
        ProfileButton(size: 100) {
            print("기본 프로필 버튼 클릭됨")
        }
    }
}

