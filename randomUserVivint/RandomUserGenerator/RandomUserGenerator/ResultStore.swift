//
//  ResultStore.swift
//  RandomUserGenerator
//
//  Created by don't touch me on 5/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class ResultStore {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchRandomUsers() {
        
        let url = ResultAPI.recentResultsURL()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = NSString(data: jsonData,
                                         encoding: String.Encoding.utf8.rawValue) {
                   print(jsonString)
                }
            }
            else if let requestError = error {
                print("Error fetching recent results: \(requestError)")
            }
            else {
                print("Unexpected error with request")
            }
            
        }
        task.resume()
    }

}
