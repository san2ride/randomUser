//
//  RandomUserController.swift
//  RandomUserGenerator
//
//  Created by don't touch me on 5/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class RandomUserController: UITableViewController {

    var result: ResultStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.fetchRandomUsers()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
}
