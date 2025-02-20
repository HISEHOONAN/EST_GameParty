//
//  GameRankingView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/14/25.
//  Code written by 윤태한 on 2/17/25//

import SwiftUI

// MARK: - 모델
struct RankingItem: Identifiable { // 순위 항목을 나타내는 모델로, Identifiable 프로토콜 사용
    let id: Int         // 각 항목의 고유 식별자
    let name: String    // 플레이어의 이름
    let tries: Int      // 시도 횟수
    let time: String    // 소요 시간
}

struct Difficulty: Identifiable { // 난이도 정보를 나타내는 모델로, Identifiable 프로토콜 사용
    let id: String      // 난이도의 고유 식별자 (예: "3", "4", "5")
    let name: String    // 사용자에게 표시할 난이도 이름 (예: "3자리")
    let color: Color    // 난이도에 할당된 색상
}

// 난이도 데이터 (Difficulty Data)
let DIFFICULTY_LEVELS: [Difficulty] = [  // 난이도 정보를 담은 배열
    Difficulty(id: "3", name: "3자리", color: Color(hex: 0x4ECDC4)), // 3자리 난이도
    Difficulty(id: "4", name: "4자리", color: Color(hex: 0xCD4EC4)), // 4자리 난이도
    Difficulty(id: "5", name: "5자리", color: Color(hex: 0xCDC44E))  // 5자리 난이도
]

// 샘플 순위 데이터
let MOCK_RANKINGS: [String: [RankingItem]] = [  // 난이도별 순위 데이터를 딕셔너리 형태로 저장
    "3": [ // "3" 난이도에 해당하는 데이터
        RankingItem(id: 1, name: "Player1", tries: 4, time: "00:45"), // 1위
        RankingItem(id: 2, name: "Player2", tries: 5, time: "01:02"), // 2위
        RankingItem(id: 3, name: "Player3", tries: 6, time: "01:15"), // 3위
    ],
    "4": [ // "4" 난이도에 해당하는 데이터
        RankingItem(id: 1, name: "Player4", tries: 4, time: "01:30"), // 1위
        RankingItem(id: 2, name: "Player5", tries: 5, time: "01:45"), // 2위
        RankingItem(id: 3, name: "Player6", tries: 6, time: "02:00"), // 3위
    ],
    "5": [ // "5" 난이도에 해당하는 데이터
        RankingItem(id: 1, name: "Player7", tries: 4, time: "02:15"), // 1위
        RankingItem(id: 2, name: "Player8", tries: 5, time: "02:30"), // 2위
        RankingItem(id: 3, name: "Player9", tries: 6, time: "02:45"), // 3위
    ],
]

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

// MARK: - RankingRow 뷰 (각 순위 항목을 표시하는 뷰)
struct RankingRow: View { // RankingRow 뷰 정의
    let index: Int         // 순위 번호(0부터 시작)
    let item: RankingItem  // 표시할 RankingItem 모델
    
    var body: some View {
        HStack(spacing: 16) {
            VStack { // VStack: 순위 번호와 1등 왕관 아이콘을 배치
                Text("\(index + 1)") // 인덱스에 1을 더해 순위를 표시
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                if index == 0 { // 첫 번째 항목인 경우 (1등)
                    Image(systemName: "crown.fill") // SF Symbols의 왕관 아이콘 표시
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: 0xFFD700))
                }
            } // VStack 종료
            .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) { // VStack: 플레이어 이름과 통계 정보를 좌측 정렬로 배치
                Text(item.name) // 플레이어 이름 표시
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                HStack { // HStack: 시도 횟수와 시간 정보를 배치
                    Text("시도: \(item.tries)회") // 시도 횟수 표시
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("시간: \(item.time)") // 소요 시간 표시
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                } // HStack 종료
            } // VStack 종료
        } // HStack 종료
        .padding(16)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color(white: 0.95)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
    }
}

// MARK: - RankingComponent 뷰 (전체 랭킹 뷰)
struct RankingComponent: View { // RankingComponent 뷰 정의
    @State private var selectedDifficulty: String = "3" // 현재 선택된 난이도를 상태 변수로 저장 (초기값 "3")
    
    var body: some View {
        VStack {
            Text("숫자야구 랭킹")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 20)
            
            // 난이도 탭 (Difficulty Tabs)
            HStack {
                ForEach(DIFFICULTY_LEVELS) { level in // DIFFICULTY_LEVELS 배열의 각 항목에 대해 반복
                    Button(action: { // 각 난이도 버튼의 액션 정의
                        selectedDifficulty = level.id // 버튼이 눌리면 선택된 난이도를 해당 id로 변경
                    }) {
                        Text(level.name) // 버튼에 난이도 이름 표시
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .foregroundColor(selectedDifficulty == level.id ? .white : .black)
                            .background(selectedDifficulty == level.id ? level.color : Color.clear)
                            .cornerRadius(12)
                    }
                } // ForEach 종료 (모든 난이도 버튼 생성)
            }
            .padding(4)
            .background(Color.white)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            // 순위 리스트 (Ranking List)
            ScrollView { // 수직 스크롤 뷰: 순위 항목들이 스크롤 가능하도록 함
                VStack(spacing: 12) { // 순위 항목들을 담는 수직 스택, 각 항목 사이에 12 포인트 간격 적용
                    if let rankings = MOCK_RANKINGS[selectedDifficulty] { // 선택된 난이도에 해당하는 순위 데이터가 있는지 확인
                        ForEach(Array(rankings.enumerated()), id: \.element.id) { index, item in // 각 순위 항목과 인덱스를 반복
                            RankingRow(index: index, item: item) // RankingRow 뷰를 통해 각 순위 항목 표시
                        }
                    }
                } // VStack 종료 (순위 항목 전체)
                .padding(.horizontal, 8)
            } // ScrollView 종료 (순위 리스트)
            
            Spacer()
        } // VStack 종료 (전체 랭킹 컴포넌트)
        .padding(16)
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview{
    RankingComponent()
}
