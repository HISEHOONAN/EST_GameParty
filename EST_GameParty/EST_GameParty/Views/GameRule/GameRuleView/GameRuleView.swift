import SwiftUI

struct GameRuleView: View {
    @State private var showAnimationView = false
    
    var body: some View {
        ZStack {
            // Match the same gradient background
            LinearGradient(gradient: Gradient(colors: [Color(hex: "0026FD"), Color(hex: "311b92")]),
                         startPoint: .top,
                         endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                if showAnimationView {
                    TitleAnimationView()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20)
                        .padding()
                } else {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showAnimationView = true
                        }
                    }) {
                        VStack(spacing: 20) {
                            // Match the rounded rectangle style from GameStartView
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 300, height: 200)
                                .overlay(
                                    VStack(spacing: 16) {
                                        Image(systemName: "questionmark.circle.fill")
                                            .font(.system(size: 80))
                                            .foregroundColor(.white)
                                        
                                        Text("게임방법 보기")
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                    }
                                )
                                .shadow(radius: 10)
                            
                            // Match the button style from GameStartView
                            HStack {
                                Image(systemName: "play.circle.fill")
                                    .font(.title2)
                                Text("터치하여 시작")
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(Color(hex: "b3e5fc"))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: "7c4dff"), Color(hex: "651fff")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(25)
                            .shadow(radius: 5)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }
}

#Preview {
    GameRuleView()
}
