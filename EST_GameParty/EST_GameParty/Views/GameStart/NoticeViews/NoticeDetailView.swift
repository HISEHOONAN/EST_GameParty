//
//  NoticeDetailView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

// 공지사항 상세 뷰
struct NoticeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let notice: Notice
    
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
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // 제목 섹션
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text(notice.category)
                                    .font(.caption.bold())
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color(hex: "2979ff"))
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                Text(notice.date)
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "b3e5fc"))
                            }
                            
                            Text(notice.title)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                            .background(Color.white.opacity(0.2))
                        
                        // 내용
                        Text(notice.content)
                            .font(.body)
                            .foregroundColor(.white)
                            .lineSpacing(6)
                    }
                    .padding()
                }
            }
        }
    }
}

