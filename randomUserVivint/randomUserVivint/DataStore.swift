//
//  DataStore.swift
//  randomUserVivint
//
//  Created by don't touch me on 5/22/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    static let sharedInstance = DataStore()
    override fileprivate init() {}
    
    var currentResult = Result()
    var resultArray = [Result]()

}
