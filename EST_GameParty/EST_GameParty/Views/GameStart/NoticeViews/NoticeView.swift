//
//  NoticeView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct NoticeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let notices = [
        Notice(
            title: "숫자야구 게임 업데이트 안내",
            date: "2025.02.24",
            category: "출시",
            content: "version 1.0.0 Release",
            isNew: true
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
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
                        
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.clear)
                    }
                    .padding()

                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(notices) { notice in
                                NavigationLink(destination: NoticeDetailView(notice: notice)) {
                                    NoticeCardView(notice: notice)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    NoticeView()
}
