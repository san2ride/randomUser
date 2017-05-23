//
//  ResultAPI.swift
//  RandomUserGenerator
//
//  Created by don't touch me on 5/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

enum Method: String {
    case RecentResults = "random.user.results"
}

class ResultAPI {
    
    private static let baseURLString = "https://randomuser.me/api/?results=50"
    
    private static func resultURL(method: Method, parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method"        : method.rawValue,
            "format"        : "json",
            "nojsoncallback": "1",
            
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static func recentResultsURL() -> URL {
        return resultURL(method: .RecentResults,
                     parameters: ["extras": "thumbnail"])
    }
    
    

}
