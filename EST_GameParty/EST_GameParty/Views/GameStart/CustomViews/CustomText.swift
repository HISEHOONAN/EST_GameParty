//
//  CustomText.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct CustomText: View {
    var title: String
    var font: Font = .title
    var textColor: Color = .white
    var backgroundColor: Color = .blue
    var cornerRadius: CGFloat = 10
    var padding: CGFloat = 16
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    
    var body: some View {
        Text(title)
            .font(font)
            .foregroundColor(textColor)
            .padding(padding)
            .frame(width: width, height: height) // 너비와 높이 지정
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomText(title: "게임 시작", font: .largeTitle, textColor: .white, backgroundColor: .red, cornerRadius: 20, width: 200, height: 60)
        
        CustomText(title: "설정", font: .title2, textColor: .black, backgroundColor: .yellow, cornerRadius: 15, width: 150, height: 50)
    }
}
