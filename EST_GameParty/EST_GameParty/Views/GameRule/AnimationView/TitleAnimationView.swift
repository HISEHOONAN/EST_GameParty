<<<<<<< HEAD:EST_GameParty/EST_GameParty/Views/GameRule/AnimationView/TitleAnimationView.swift
//  RuleItemView.swift
//  EST_GameParty
//
//  Created by 원대한 on 2/20/25.
//

=======
>>>>>>> Feature/GameStart:EST_GameParty/EST_GameParty/Views/GameRule/AnimationView.swift
import SwiftUI


struct TitleAnimationView: View {
   
   @State private var title: String = "게임 방법"
   @State private var animateTitle: String = "" // 애니메이션되는 제목 텍스트
   @State private var titleIndex = 0
   @State private var displayedRules: [String] = [] // 화면에 표시된 규칙들을 담는 배열
   @State private var currentRuleIndex = 0
   @State private var showInitialTitle = true // 초기 제목을 보여줄지 여부
   
   
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
   
   // 화면에 표시될 뷰를 정의
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
       // 뷰가 나타날 때 제목 애니메이션을 시작
       .onAppear {
           startTitleAnimation()
       }
   }
   
   // 제목 애니메이션을 시작하는 함수
   private func startTitleAnimation() {
      
       Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
           if titleIndex < title.count { // 아직 모든 글자를 표시하지 않았다면
               // 한 글자씩 추가
               animateTitle += String(title[title.index(title.startIndex, offsetBy: titleIndex)])
               titleIndex += 1
           } else { // 모든 글자를 표시했다면
               timer.invalidate() // 타이머 중지
               
               DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                   withAnimation(.easeInOut(duration: 0.5)) {
                       showInitialTitle = false
                   }
                   startRulesAnimation() // 규칙 애니메이션 시작
               }
           }
       }
   }
   
   // 규칙들을 하나씩 표시하는 애니메이션 함수
   private func startRulesAnimation() {
       guard currentRuleIndex < rules.count else { return } // 모든 규칙을 표시했다면 종료
       
       // 규칙을 하나씩 추가
       withAnimation(.easeInOut(duration: 1)) {
           displayedRules.append(rules[currentRuleIndex])
       }
       
       currentRuleIndex += 1 // 다음 규칙으로
       
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
           startRulesAnimation()
       }
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
