//
//  News.swift
//  GetNewsVK
//
//  Created by Тимур Шафигуллин on 22.01.18.
//  Copyright © 2018 Тимур Шафигуллин. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    struct NewsInfo: Codable {
        struct News: Codable {
            let id: Int
            let from_id: Int
            let owner_id: Int
            let date: Int
            let text: String
        }
        
        let count: Int
        let items: [News]
    }
    
    let response: NewsInfo
}
