//
//  SubMenuTableViewController.swift
//  MultiMenu
//
//  Created by Charles Konkol on 12/1/18.
//  Copyright © 2018 Charles Konkol. All rights reserved.
//

import UIKit

class SubMenuTableViewController: UITableViewController {
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
         self.dismiss(animated: false, completion: nil)
    }
    
    
     var ViewControllers: ViewController? = nil
    
    var ListOfSocialMediaItems:[String]?
    var ListOfSearchEnginestems:[String]?
    var ListOfArtificialIntelligenceItems:[String]?
    var Choice:[String]?
    
    //3) Chamge to AnyObject?
    var submenuItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
      //  clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if submenuItem != nil {
            ListOfSocialMediaItems = ["YouTube","Twitter", "Instagram"]
            ListOfSearchEnginestems = ["Google","Yahoo", "Bing"]
            ListOfArtificialIntelligenceItems = ["Siri","Alexa", "IBM"]
            if let submenuitem = submenuItem as? String{
                if submenuitem == "0"{
                    Choice = ListOfSocialMediaItems
                }
                if submenuitem == "1"{
                     Choice = ListOfSearchEnginestems
                }
                if submenuitem == "2"{
                     Choice = ListOfArtificialIntelligenceItems
                }
            }
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.ViewControllers = (controllers[controllers.count-1] as! UINavigationController).topViewController as? ViewController
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Choice!.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // 8) Replace code with below code until }
        cell.textLabel!.text = Choice![indexPath.row]
        cell.detailTextLabel?.text = ">>"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "DetailView" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // 6) replace code with below code until line 75
                let object = Choice![indexPath.row]
                let nav = segue.destination as! UINavigationController
                let controller = nav.topViewController as! ViewController
                controller.submenuItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = Choice![indexPath.row]
            }
        }
    }
   

}
