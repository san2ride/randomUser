//
//  UserAPI.swift
//  randomProfile.Vivint
//
//  Created by don't touch me on 5/22/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

enum UserResult {
    case Success([User])
    case Failure(Error)
}

enum UserError: Error {
    case InvalidJSON
    
}

class UserAPI {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchUsers(completion: @escaping ([User]) -> Void) {
        
        var users = [User]()
        
        let url = URL(string: "https://randomuser.me/api/?results=50")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            guard error == nil else {
                print("error getting users from ramdomusermeAPI")
                print(error?.localizedDescription as Any)
                return
            }
            
            guard let reponseData = data else {
                print("Error: did not recieve data")
                return
            }
            
            do {
                guard let usersJSON = try JSONSerialization.jsonObject(with: reponseData, options: []) as? [String: AnyObject], let user =
                    usersJSON["results"] as? [[String: AnyObject]] else {
                        print("Error trying to convert data to JSON")
                        return
                }
                
                users = user.flatMap { json in
                    
                    guard let first = json["first"] as? String,
                        let last = json["last"] as? String,
                        let email = json["email"] as? String,
                        let phone = json["phone"] as? String,
                        let thumbnail = json["image"] as? UIImage else {
                        print("Error: could not turn map into json")
                        return nil
                
                    }
                    
                    let u = User(first: first, last: last, email: email, phone: phone, thumbnail: thumbnail)
                    return u
                }
                completion(users)
                
            } catch {
                print("Error trying to convert data to JSON")
                return
            }
        })
        task.resume()
        
        return
    }

}
