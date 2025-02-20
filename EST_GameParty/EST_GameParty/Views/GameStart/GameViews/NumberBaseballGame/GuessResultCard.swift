//
//  GuessResultCard.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//
import SwiftUI

struct GuessResultCard: View {
    let guess: String
    let result: String
    let attempt: Int
    
    var body: some View {
        HStack {
            Text("#\(attempt)")
                .font(.headline)
                .foregroundColor(Color(hex: "b3e5fc"))
            
            Spacer()
            
            Text(guess)
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Spacer()
            
            Text(result)
                .font(.headline)
                .foregroundColor(Color(hex: "00b0ff"))
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
