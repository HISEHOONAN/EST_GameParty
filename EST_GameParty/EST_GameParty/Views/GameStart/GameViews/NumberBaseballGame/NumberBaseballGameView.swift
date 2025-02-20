//
//  NumberBaseballGameView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/20/25.
//

import SwiftUI

struct NumberBaseballGameView: View {
    //화면 전환
    @Environment(\.dismiss) private var dismiss
    //유저숫자
    @State private var userInput = ""
    //지금까지의 숫자 기록
    @State private var gameHistory: [(guess: String, result: String)] = []
    //정답
    @State private var targetNumber = generateTargetNumber()
    //게임 끝
    @State private var showGameOver = false
    //시도 횟수
    @State private var attempts = 0
    
    static func generateTargetNumber() -> String {
        var numbers = Array(0...9)
        numbers.shuffle()
        return String(numbers[0...2].map { String($0) }.joined())
    }
    
    var body: some View {
        ZStack {
            // 배경 그라데이션
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
                        TextField("3자리 숫자 입력", text: $userInput)
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
                        .disabled(userInput.count != 3)
                    }
                    .padding()
                }
            }
        }
        .alert("게임 종료!", isPresented: $showGameOver) {
            Button("새 게임", action: resetGame)
        } message: {
            Text("축하합니다! \(attempts)번 만에 맞추셨습니다!")
        }
    }
    //MARK: - 야구게임
    private func checkGuess() {
        guard userInput.count == 3 else { return }
        
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
        
        if strikes == 3 {
            showGameOver = true
        }
    }
    
    private func resetGame() {
        targetNumber = Self.generateTargetNumber()
        gameHistory.removeAll()
        attempts = 0
        userInput = ""
        showGameOver = false
    }
}
