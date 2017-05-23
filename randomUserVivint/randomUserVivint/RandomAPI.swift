//
//  RandomAPI.swift
//  randomUserVivint
//
//  Created by don't touch me on 5/20/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class RandomAPI {
    
    let headers = [
        "content-type" : "application/json",
        "accept"       : "application/json",
        "cache-control": "no-cache"
    ]
    
    func retrieveResults(_ searchedData: String) {
        
        let request = NSMutableURLRequest(url: URL(string: "https://randomuser.me/api/?results=50\(searchedData)")!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
            
        }()
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) -> Void in
            
            if (error != nil) {
                print(error!)
            } else {
                
                if let data = data {
                    
                    do {
                        if let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject] {
                            print(dict)
                            if let resultDict = dict["result"] as? JSONDictionary {
                                
                                let result = Result(dict: resultDict)
                                print("Result")
                                
                                DispatchQueue.main.async (execute: {
                                    DataStore.sharedInstance.resultArray.append(result)
                                    
                                })
                            }
                        }
                    } catch {
                        print("couldn't parse")
                    }
                }
            }
            
        })
        dataTask.resume()
        
    }
    
}
