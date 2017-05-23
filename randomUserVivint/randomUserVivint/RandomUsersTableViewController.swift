//
//  RandomUsersTableViewController.swift
//  randomUserVivint
//
//  Created by don't touch me on 5/20/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class RandomUsersTableViewController: UITableViewController {
    

    
    
    let kResult = "kResult"
    var currentResult: Result?
    var resultArray = [Result]()
    var randomAPI = RandomAPI()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewUser(_ sender: UIBarButtonItem) {
        
        self.randomAPI.retrieveResults("searchedData")
        
        
//        if let index = usersArray.index(of: newUser) {
//            let indexPath = NSIndexPath(row: index, section: 0)
//            
//            tableView(at: [indexPath as IndexPath], with: .automatic)
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! RandomUsersTableViewCell
        
        self.currentResult = DataStore.sharedInstance.resultArray[indexPath.row]
        
        return cell
    }
    

   
}
