//
//  AnimationView.swift
//  EST_GameParty
//
//  Created by 원대한 on 2/18/25.
//

import SwiftUI

struct AnimationView: View {
    @State var title: String = "게임 방법"
    @State var animateTitle: String = ""
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.2
    
    var body: some View {
        VStack {
            Text(animateTitle)
                .font(.largeTitle)
                .onAppear{
                    startAnimation()
                }
        }
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true){ timer in
            if indexValue < title.count{
                animateTitle += String(title[title.index(title.startIndex, offsetBy: indexValue)])
                
                indexValue += 1
            }else{
                timer.invalidate()
            }
                
        }
    }
}

#Preview {
    AnimationView()
}
