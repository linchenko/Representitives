//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //???????
        guard let state = state else {return}
        RepresentativeController.shared.searchRepresentatives(forState: state) { (result) in
            guard let result = result else {return}
            print(Thread.isMainThread)
            DispatchQueue.main.async {
                self.result = result
                self.tableView.reloadData()
                print(Thread.isMainThread)
                
            }
        }

    }
    
    var result: [Representative] = []
    var state: String?



    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return result.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath)

        cell.textLabel?.text = result[indexPath.row].name
        cell.detailTextLabel?.text = result[indexPath.row].party

        return cell
    }
 



    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailRepVC"{
            let destinationVC = segue.destination as? RepresentativeViewController
            guard let indexPath = tableView.indexPathForSelectedRow  else {return}
            let representative = result[indexPath.row]
            destinationVC?.representative = representative
            
        }
    }
 

}
