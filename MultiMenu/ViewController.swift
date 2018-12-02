//
//  ViewController.swift
//  MultiMenu
//
//  Created by Charles Konkol on 12/1/18.
//  Copyright © 2018 Charles Konkol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblShow: UILabel!
    
    @IBOutlet weak var txtShow: UITextField!
    //3) Chamge to AnyObject?
    //3) Chamge to AnyObject?
    var submenuItem:  String!
    
    
    @IBAction func btnBack(_ sender: UIButton) {
         self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // configureView()
        print(submenuItem)
        lblShow.text = "The selected item is: \(submenuItem!)"
        //lblShow.text = navigationItem.title
        // Do any additional setup after loading the view, typically from a nib.
    }


}

