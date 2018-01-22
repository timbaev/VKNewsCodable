//
//  ViewController.swift
//  GetNewsVK
//
//  Created by Тимур Шафигуллин on 22.01.18.
//  Copyright © 2018 Тимур Шафигуллин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getNews(with: accessToken, count: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNews(with token: String, count: Int) {
        
        let request = GetNewsRequest(count: count, token: token)
        ApiProvider().makeRequest(with: request) { (data) in
            guard let data = data else { return }
            
            let resposeString = String(data: data, encoding: .utf8)
            print(resposeString ?? "none")
            
            do {
                let _ = try JSONDecoder().decode(NewsResponse.self, from: data)
                print("SUCCESS!!")
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
        
    }


}

