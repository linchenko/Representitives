//
//  StatesTableViewController.swift
//  Representatives
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class StatesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return States.all.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "States", for: indexPath)
        
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        
        return cell
    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailStateVC"{
            let destinationVC = segue.destination as? StateDetailTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow  else {return}
            let state = States.all[indexPath.row]
            destinationVC?.state = state
        }
    }
    
    
}
