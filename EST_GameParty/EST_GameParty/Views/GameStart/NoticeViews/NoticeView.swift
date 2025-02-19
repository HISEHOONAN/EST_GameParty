//
//  NoticeView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct NoticeView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedNotice: Notice?
    @State private var showDetail = false
    
    // 샘플 공지사항 데이터
    let notices = [
        Notice(
            title: "숫자야구 게임 업데이트 안내",
            date: "2025.02.19",
            category: "업데이트",
            content: "1. 게임 성능 최적화\n2. 새로운 도전과제 추가\n3. UI/UX 개선\n4. 버그 수정",
            isNew: true
        ),
        Notice(
            title: "2월 이벤트 안내",
            date: "2025.02.15",
            category: "이벤트",
            content: "2월 한달 간 매일 첫 게임 승리 시 특별 보상이 지급됩니다!",
            isNew: true
        ),
        Notice(
            title: "서버 점검 안내",
            date: "2025.02.10",
            category: "점검",
            content: "2025년 2월 11일 02:00 ~ 06:00\n정기 서버 점검이 진행됩니다.",
            isNew: false
        ),
        Notice(
            title: "게임 규칙 안내",
            date: "2025.02.01",
            category: "안내",
            content: "숫자야구 게임의 기본 규칙을 안내드립니다.\n\n1. 3자리의 서로 다른 숫자를 맞추는 게임입니다.\n2. 숫자와 위치가 모두 맞으면 스트라이크\n3. 숫자는 맞지만 위치가 다르면 볼\n4. 3스트라이크면 게임 승리!",
            isNew: false
        )
    ]
    
    var body: some View {
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
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("공지사항")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // 균형을 위한 빈 공간
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.clear)
                }
                .padding()
                
                // 공지사항 목록
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(notices) { notice in
                            NoticeCardView(notice: notice)
                                .onTapGesture {
                                    selectedNotice = notice
                                    showDetail = true
                                }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showDetail) {
            if let notice = selectedNotice {
                NoticeDetailView(notice: notice)
            }
        }
    }
}

// 공지사항 카드 컴포넌트

#Preview {
    NoticeView()
}
