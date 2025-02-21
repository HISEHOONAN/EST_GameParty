//
//  RankingItem.swift
//  EST_GameParty
//
//  Created by 윤태한 on 2/20/25.
//

import SwiftUI

// MARK: - 모델
struct RankingItem: Identifiable {
    let id: Int         // 각 항목의 고유 식별자
    let name: String    // 플레이어의 이름
    let tries: Int      // 시도 횟수
    let time: String    // 소요 시간
}

struct Difficulty: Identifiable {
    let id: String      // 난이도 id
    let name: String    // 사용자에게 표시할 난이도 이름
    let color: Color    // 난이도에 할당된 색상
}

// 난이도 데이터 (Difficulty Data)
let DIFFICULTY_LEVELS: [Difficulty] = [
    Difficulty(id: "3", name: "3자리", color: Color(hex: "4ECDC4")),
    Difficulty(id: "4", name: "4자리", color: Color(hex: "CD4EC4")),
    Difficulty(id: "5", name: "5자리", color: Color(hex: "CDC44E"))
]

