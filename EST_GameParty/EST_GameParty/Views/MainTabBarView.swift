//
//  MainTabBarView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
            TabView {
                GameStartView()
                    .tabItem {
                        Label("게임 시작", systemImage: "play.circle")
                    }
                GameRuleView()
                    .tabItem {
                        Label("게임 방법", systemImage: "book")
                    }
                
                GameRankingView()
                    .tabItem {
                        Label("랭킹", systemImage: "trophy")
                    }
            }
        }
}

#Preview {
    MainTabBarView()
}
