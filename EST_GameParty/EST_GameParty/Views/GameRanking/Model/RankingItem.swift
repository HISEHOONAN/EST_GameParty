//
//  RankingItem.swift
//  EST_GameParty
//
//  Created by 윤태한 on 2/20/25.
//

import SwiftUI

// MARK: - 모델
struct RankingItem: Identifiable, Codable {
    let id: Int
    let name: String
    let tries: Int
    let time: String
}

struct Difficulty: Identifiable {
    let id: String
    let name: String
    let color: Color
}

let DIFFICULTY_LEVELS: [Difficulty] = [
    Difficulty(id: "3", name: "3자리", color: Color(hex: "4ECDC4")),
    Difficulty(id: "4", name: "4자리", color: Color(hex: "CD4EC4")),
    Difficulty(id: "5", name: "5자리", color: Color(hex: "CDC44E"))
]

