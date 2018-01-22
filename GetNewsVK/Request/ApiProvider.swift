//
//  ApiProvider.swift
//  RoomDebtsiOS
//
//  Created by Тимур Шафигуллин on 26.12.17.
//  Copyright © 2017 Тимур Шафигуллин. All rights reserved.
//
import Foundation

class ApiProvider {
    
    private var baseURL: URL!
    
    init(baseURL: URL = URL(string: "https://api.vk.com/method")!) {
        self.baseURL = baseURL
    }
    
    func makeRequest(with request: Request, completionBlock: @escaping (Data?) -> ()) {
        var url = baseURL.appendingPathComponent(request.endPoint)
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = request.method.rawValue
        
        var parameters = ""
        for (offset: i, element: (key: key, value: value)) in request.parameters.enumerated() {
            parameters += "\(key)=\(value)"
            if i != request.parameters.count - 1 {
                parameters += "&"
            }
        }
        
        if request.method == .post {
            urlRequest.httpBody = parameters.data(using: .utf8)
        } else if request.method == .get, !parameters.isEmpty {
            let urlWithParams = url.absoluteString + "?\(parameters)"
            guard let urlParameters = URL(string: urlWithParams) else { return }
            url = urlParameters
            urlRequest.url = url
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                completionBlock(nil)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("reponse = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            completionBlock(data)
        }
        task.resume()
    }
    
}

