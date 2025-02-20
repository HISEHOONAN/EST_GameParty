//
//  RankingItem.swift
//  EST_GameParty
//
//  Created by 윤태한 on 2/20/25.
//


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
    Difficulty(id: "3", name: "3자리", color: Color(hex: "4ECDC4")), // 3자리 난이도
    Difficulty(id: "4", name: "4자리", color: Color(hex: "CD4EC4")), // 4자리 난이도
    Difficulty(id: "5", name: "5자리", color: Color(hex: "CDC44E"))  // 5자리 난이도
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
