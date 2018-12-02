//
//  MainMenuTableViewController.swift
//  MultiMenu
//
//  Created by Charles Konkol on 12/1/18.
//  Copyright © 2018 Charles Konkol. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {

    var subMenuTableViewController: SubMenuTableViewController? = nil
    
    var ListOfMenu:[String]?
    var ListOfSubMenu:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListOfMenu = ["Social Media","Search Engines", "Artifical Intellienge"]
        ListOfSubMenu = ["0","1", "2"]
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.subMenuTableViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? SubMenuTableViewController
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ListOfMenu!.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // 8) Replace code with below code until }
        cell.textLabel!.text = ListOfMenu![indexPath.row]
        cell.detailTextLabel?.text = ">>"
        return cell
        
    }
  

   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
   

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubMenu" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // 6) replace code with below code until line 75
                let object = ListOfSubMenu![indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! SubMenuTableViewController
                controller.submenuItem = object as AnyObject
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = ListOfMenu![indexPath.row]
            }
        }
    }
    

}
