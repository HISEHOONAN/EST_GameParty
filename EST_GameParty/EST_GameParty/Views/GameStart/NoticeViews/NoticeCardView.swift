//
//  NoticeCardView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/19/25.
//

import SwiftUI

struct NoticeCardView: View {
    let notice : Notice
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(notice.category)
                    .font(.caption.bold())
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(categoryColor(notice.category))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                if notice.isNew {
                    Text("NEW")
                        .font(.caption.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(hex: "ff1744"))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
                
                Text(notice.date)
                    .font(.caption)
                    .foregroundColor(Color(hex: "b3e5fc"))
            }
            
            Text(notice.title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(notice.content)
                .font(.subheadline)
                .foregroundColor(Color(hex: "b3e5fc"))
                .lineLimit(2)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    func categoryColor(_ category: String) -> Color {
        switch category {
        case "업데이트":
            return Color(hex: "2979ff")
        case "이벤트":
            return Color(hex: "7c4dff")
        case "점검":
            return Color(hex: "f57c00")
        default:
            return Color(hex: "00b0ff")
        }
    }
}


#Preview {
    NoticeCardView(notice: Notice(
        title: "게임 규칙 안내",
        date: "2025.02.01",
        category: "안내",
        content: "숫자야구 게임의 기본 규칙을 안내드립니다.\n\n1. 3자리의 서로 다른 숫자를 맞추는 게임입니다.\n2. 숫자와 위치가 모두 맞으면 스트라이크\n3. 숫자는 맞지만 위치가 다르면 볼\n4. 3스트라이크면 게임 승리!",
        isNew: false
    ))
}
