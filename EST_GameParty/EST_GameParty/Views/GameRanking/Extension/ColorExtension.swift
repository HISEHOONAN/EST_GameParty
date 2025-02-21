//
//  ColorExtension.swift
//  EST_GameParty
//
//  Created by 윤태한 on 2/20/25.
//


import SwiftUI

// MARK: - Color Extension
// 16진수 값을 사용하여 Color를 생성할 수 있도록 확장합니다.
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
