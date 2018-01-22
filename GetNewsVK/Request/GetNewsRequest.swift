//
//  GetNewsRequest.swift
//  GetNewsVK
//
//  Created by Тимур Шафигуллин on 22.01.18.
//  Copyright © 2018 Тимур Шафигуллин. All rights reserved.
//
import Foundation

class GetNewsRequest: Request {
    
    var method: Methods = .get
    var endPoint = "wall.get"
    var parameters: [String : Any]
    
    private let countKey = "countKey"
    private let tokenKey = "access_token"
    private let versionKey = "v"

    init(count: Int, token: String) {
        self.parameters = [countKey: count, tokenKey: token, versionKey: apiVersion]
    }
}
