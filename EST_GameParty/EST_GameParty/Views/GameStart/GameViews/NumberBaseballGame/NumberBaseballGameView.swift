//
//  NumberBaseballGameView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//

import SwiftUI

struct NumberBaseballGameView: View {
    
    @Environment(\ .dismiss) private var dismiss
    @State private var userInput = ""
    @State private var gameHistory: [(guess: String, result: String)] = []
    @State private var targetNumber: String
    @State private var showGameOver = false
    @State private var attempts = 0
    
    let difficulty: DifficultySelector.Difficulty
    
    init(difficulty: DifficultySelector.Difficulty) {
        self.difficulty = difficulty
        _targetNumber = State(initialValue: Self.generateTargetNumber(digits: difficulty.digitCount))
    }
    
    static func generateTargetNumber(digits: Int) -> String {
        var numbers = Array(0...9)
        numbers.shuffle()
        return String(numbers[0..<digits].map { String($0) }.joined())
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 헤더
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("숫자야구")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: resetGame) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                // 게임 기록
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(gameHistory.indices, id: \.self) { index in
                            GuessResultCard(
                                guess: gameHistory[index].guess,
                                result: gameHistory[index].result,
                                attempt: index + 1
                            )
                        }
                    }
                    .padding()
                }
                
                // 입력 영역
                VStack(spacing: 16) {
                    HStack {
                        TextField("\(difficulty.digitCount)자리 숫자 입력", text: $userInput)
                            .keyboardType(.numberPad)
                            .font(.title3)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Button(action: checkGuess) {
                            Image(systemName: "paperplane.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(hex: "00b0ff"))
                                )
                        }
                        .disabled(userInput.count != difficulty.digitCount)
                    }
                    .padding()
                }
                .navigationBarBackButtonHidden()
                
                Spacer()
            }
        }
        .alert("게임 종료!", isPresented: $showGameOver) {
            Button("새 게임", action: resetGame)
        } message: {
            Text("축하합니다! \(attempts)번 만에 맞추셨습니다!")
        }
    }
    
    private func checkGuess() {
        guard userInput.count == difficulty.digitCount else { return }
        
        var strikes = 0
        var balls = 0
        
        for (index, digit) in userInput.enumerated() {
            if targetNumber.contains(digit) {
                if targetNumber[targetNumber.index(targetNumber.startIndex, offsetBy: index)] == digit {
                    strikes += 1
                } else {
                    balls += 1
                }
            }
        }
        
        attempts += 1
        let result = "\(strikes)S \(balls)B"
        gameHistory.insert((guess: userInput, result: result), at: 0)
        userInput = ""
        
        if strikes == difficulty.digitCount {
            showGameOver = true
        }
    }
    
    private func resetGame() {
        targetNumber = Self.generateTargetNumber(digits: difficulty.digitCount)
        gameHistory.removeAll()
        attempts = 0
        userInput = ""
        showGameOver = false
    }
}



