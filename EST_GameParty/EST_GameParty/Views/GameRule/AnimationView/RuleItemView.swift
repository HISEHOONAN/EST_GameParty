//
//  RuleItemView.swift
//  EST_GameParty
//
//  Created by 원대한 on 2/20/25.
//
import SwiftUI

struct RuleItemView: View {
    let rule: String
    let isTitle: Bool
    
    var body: some View {
        HStack {
            Text(rule)
                .font(isTitle ? .title3.bold() : .body)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    LinearGradient(
                        colors: isTitle
                            ? [Color(hex: "00b0ff"), Color(hex: "2979ff")]
                            : [Color.white.opacity(0.1), Color.white.opacity(0.15)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        )
    }
}
