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
       "1️⃣ 컴퓨터가 서로 다른 3자리 숫자를 무작위로 선택합니다",
       "2️⃣ 플레이어는 3자리 숫자를 추측해서 입력합니다",
       "3️⃣ 숫자와 위치가 모두 맞으면 스트라이크(S)",
       "4️⃣ 숫자는 맞지만 위치가 다르면 볼(B)",
       "5️⃣ 숫자가 하나도 맞지 않으면 아웃(OUT)",
       "🎯 예시:",
       "정답: 123",
       "추측: 145 → 1S (1이 정확한 위치)",
       "추측: 321 → 1S 2B (1개 위치 정확, 2개 숫자만 일치)",
       "⭐ 3개의 스트라이크(3S)를 맞추면 승리!"
   ]
   
   var body: some View {
       ScrollView {
           VStack(spacing: 15) {
               if showInitialTitle {
                   Text(animateTitle)
                       .font(.largeTitle)
                       .foregroundStyle(.red)
                       .padding(.bottom, 20)
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
       .background(Color(.systemGray6))
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
               // 제목 애니메이션이 끝나면 1초 후에 규칙 애니메이션 시작
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
       Text(rule)
           .font(isTitle ? .title.bold() : .body)
           .foregroundColor(isTitle ? .red : .primary)
           .frame(maxWidth: .infinity, alignment: .leading)
           .padding(15)
           .background(
               RoundedRectangle(cornerRadius: 10)
                   .fill(Color.white)
                   .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
           )
   }
}

struct TitleAnimationView_Previews: PreviewProvider {
   static var previews: some View {
       TitleAnimationView()
   }
}
