import SwiftUI

struct GameRuleView: View {
    @State private var showAnimationView = false
    
    var body: some View {
        VStack {
            if showAnimationView {
                TitleAnimationView()
            } else {
                Button(action: {
                    withAnimation {
                        showAnimationView = true
                    }
                }) {
                    VStack(spacing: 12) {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.blue)
                        
                        Text("게임방법 보기")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    GameRuleView()
}
