//
//  Request.swift
//  GetNewsVK
//
//  Created by Тимур Шафигуллин on 22.01.18.
//  Copyright © 2018 Тимур Шафигуллин. All rights reserved.
//

import Foundation

protocol Request {
    
    var method: Methods { get }
    var endPoint: String { get }
    var parameters: [String: Any] { get }
    
}

enum Methods: String {
    case get = "GET"
    case post = "POST"
}
