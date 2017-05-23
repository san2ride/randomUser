//
//  User.swift
//  randomProfile.Vivint
//
//  Created by don't touch me on 5/21/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class User {
    
    var first: String
    var last: String
    var email: String
    var phone: String
    var thumbnail: UIImage?
    
    init(first: String, last: String, email: String, phone: String, thumbnail: UIImage) {
        self.first = first
        self.last = last
        self.email = email
        self.phone = phone
        self.thumbnail = thumbnail
    }

}
