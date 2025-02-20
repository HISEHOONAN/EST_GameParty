import SwiftUI

struct TitleAnimationView: View {
    @State private var title: String = "게임 방법"
    @State private var animateTitle: String = ""
    @State private var titleIndex = 0
    @State private var displayedRules: [String] = []
    @State private var currentRuleIndex = 0
    @State private var showInitialTitle = true
    
    private let rules = [
        "🎮 숫자야구 게임 규칙",
        "1️⃣ 컴퓨터가 서로 다른 3(4 or 5)자리 숫자를 무작위로 선택합니다",
        "2️⃣ 플레이어는 3자리 숫자를 추측해서 입력합니다",
        "3️⃣ 숫자와 위치가 모두 맞으면 스트라이크(S)",
        "4️⃣ 숫자는 맞지만 위치가 다르면 볼(B)",
        "5️⃣ 숫자가 하나도 맞지 않으면 아웃(OUT)",
        "🎯 Example)정답: 123",
        "추측: 145 → 1S (1이 정확한 위치)",
        "추측: 321 → 1S 2B (1개 위치 정확, 2개 숫자만 일치)",
        "⭐ 3개의 스트라이크(3S)를 맞추면 승리!"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if showInitialTitle {
                    Text(animateTitle)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .transition(.opacity)
                }
                
                ForEach(displayedRules.indices, id: \.self) { index in
                    RuleItemView(rule: displayedRules[index], isTitle: index == 0)
                        .transition(.asymmetric(
                            insertion: .opacity.combined(with: .slide),
                            removal: .opacity
                        ))
                }
            }
            .padding(20)
        }
        .onAppear {
            startTitleAnimation()
        }
    }
    
    private func startTitleAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if titleIndex < title.count {
                animateTitle += String(title[title.index(title.startIndex, offsetBy: titleIndex)])
                titleIndex += 1
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showInitialTitle = false
                    }
                    startRulesAnimation()
                }
            }
        }
    }
    
    private func startRulesAnimation() {
        guard currentRuleIndex < rules.count else { return }
        
        withAnimation(.easeInOut(duration: 1)) {
            displayedRules.append(rules[currentRuleIndex])
        }
        
        currentRuleIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            startRulesAnimation()
        }
    }
}

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

#Preview {
    ZStack {
        LinearGradient(
            gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        
        TitleAnimationView()
    }
}
