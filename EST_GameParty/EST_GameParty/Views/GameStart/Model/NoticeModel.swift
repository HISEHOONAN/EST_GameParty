//
//  NoticeModel.swift
//  EST_GameParty
//
//  Created by 안세훈 on 2/19/25.
//

import Foundation

struct Notice: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let category: String
    let content: String
    let isNew: Bool
}
