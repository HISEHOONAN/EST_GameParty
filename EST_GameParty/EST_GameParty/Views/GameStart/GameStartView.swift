//
//  GameStartView.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct GameStartView: View {
    var body: some View {
#warning("기본적인 UI는 정하지 않았으니 일단 대충 이래도 진행.")
#warning("글씨체, 글씨크기, 폰트색, 백그라운드색, 둥글기, 등등")
        // 기본 로고 (왼쪽 위 정렬)
        VStack{
            Spacer()
            HStack {
                Text("EST GameParty")
                    .font(.title)
                    .background(.gray)
                    .padding(.leading, 20) // 왼쪽에서 20만큼 여백
                
                Spacer() // Text와 ProfileButton 사이의 공간을 확장
                
                ProfileButton(size: 60) {
                    goMypage()
                }
                .padding(.trailing, 20) // 오른쪽에서 20만큼 여백
            }
            .background(.yellow)
            .frame(maxWidth: .infinity) // HStack 너비를 뷰의 너비와 같게 설정
            
            
            Spacer()
            
            ZStack {
                // 버튼들을 중앙에 배치
                VStack(spacing: 20) { // 버튼 사이 간격 설정
                    CustomButton(title: "게임 시작", font: .largeTitle, textColor: .white, backgroundColor: .red, cornerRadius: 20, width: 200, height: 60, action: {
                        goStart()
                    })
                    
                    CustomButton(title: "게임 방법", font: .largeTitle, textColor: .white, backgroundColor: .red, cornerRadius: 20, width: 200, height: 60, action: {
                        goRule()
                    })
                    CustomButton(title: "공지 사항", font: .largeTitle, textColor: .white, backgroundColor: .red, cornerRadius: 20, width: 200, height: 60, action: {
                        goNotice()
                    })
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .alignmentGuide(.top) { _ in UIScreen.main.bounds.height / 2 }
                
            }
        }
    }
    
    func goStart(){
        print("게임 시작 버튼 클릭됨")
    }
    func goRule(){
        print("게임 방법 버튼 클릭됨")
    }
    func goNotice(){
        print("공지사항 버튼 클릭됨")
    }
    
    func goMypage(){
        print("기본 프로필 버튼 클릭됨")
    }
}

#Preview {
    GameStartView()
}
