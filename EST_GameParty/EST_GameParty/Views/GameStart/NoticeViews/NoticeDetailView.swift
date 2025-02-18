//
//  NoticeDetailView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct NoticeDetailView: View {
    // 공지사항 데이터를 전달받기 위한 변수
    var notice: GameNotice
    
    var body: some View {
        VStack {
            Text(notice.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("날짜: \(notice.date)")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            // 추가적인 공지사항 내용 표시
            Text(notice.contents)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("공지 상세")
    }
}

#Preview {
    NoticeDetailView(notice: GameNotice(title: "게임 시작 안내", date: "2025-02-18", contents: "좋았던 기억만 가져가라 그럭저럭 참아볼만해 그럭저럭 견뎌낼만해 너ㅏㄴ 그럴 수록 행복해야해 하루ㅡ할우하루 무뎌져가네에 나를 떠ㅏ나ㅣ서 맘 편해지길 너를 잊고서 살아가줘 그 눈물이 다마를테니에 하루하루 지나면 차라리만나지않았더라면 덜 아플텐데에... 영원히 함께하자던 그야소ㅓㄱ이제 추억에 묻어두길바렐 베ㅔ이베 더 도ㅓㄹ아보지 말고 도ㅓㄹ아가ㅣ ㅏㄴ더 낧,릉"))
}
