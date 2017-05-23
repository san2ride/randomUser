//
//  RandomUserController.swift
//  randomProfile.Vivint
//
//  Created by don't touch me on 5/21/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class RandomUserController: UITableViewController {
    
    var users: UserAPI!
    var userData = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        users.fetchUsers() { (users) -> Void in
            self.userData = users
            print(self.userData)
            
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)

        

        return cell
    }


    
}
