//
//  NoticeView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct NoticeView: View {
    
    // 공지사항 리스트
    var noticeList = [
        GameNotice(title: "게임 시작 안내", date: "2025-02-18", contents: "게임 시작 안내에 관련한 공지사항을 적음면 됩니다. 근데 할 말이 없으니 그냥 아무말이나 적겠습니다. 독도는 우리땅 ."),
        GameNotice(title: "게임 규칙 업데이트", date: "2025-02-19", contents: "게임 규칙 업데이트에 대한 설명을 여기에 주저리 주저리 적으면 됩니다 아 근데 배고프당 흐하ㅣㅎㅎㅎ"),
        GameNotice(title: "공지 사항", date: "2025-02-20", contents: "공지사항에 대한 컨텐츠를 적습니다. 내가 없인 단하루도 모ㅓㅅ살것 만 같았던 나 보고싶다고 불러봐더 너ㅏㄴ 아무 대다ㅓㅂ없잖아>? 니옆에 있는 그 사람이 뭔지 널 울리지 않랑쓴ㄴ지 빅뱅최고 하루하루 ㅋㅋ")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                // 타이틀
                Text("공지사항")
                    .font(.largeTitle)
                    .padding()
                
                // 공지사항 리스트
                List(noticeList, id: \.title) { notice in
                    NavigationLink(destination: NoticeDetailView(notice: notice)){
                        VStack(alignment: .leading) {
                            Text(notice.title)
                                .font(.headline)
                            Text(notice.date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoticeView()
}
