//
//  Result.swift
//  randomUserVivint
//
//  Created by don't touch me on 5/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class Result: NSObject {
    
    var first:     String = ""
    var last:      String = ""
    var email:     String = ""
    var phone:     String = ""
    
    
    override init() {
        super.init()
    }
    
    init(dict: JSONDictionary) {
        super.init()
        
        if let first = dict["first"] as? String {
            self.first = first
        } else {
            print("I could not parse the first name")
        }
        
        if let last = dict["last"] as? String {
            self.last = last
        } else {
            print("I could not parse the last name")
        }
        
        if let email = dict["email"] as? String {
            self.email = email
        } else {
            print("I could not parse the email")
        }
        
        if let phone = dict["phone"] as? String {
            self.phone = phone
        } else {
            print("I could not parse the phone")
        }
        
    }


}
