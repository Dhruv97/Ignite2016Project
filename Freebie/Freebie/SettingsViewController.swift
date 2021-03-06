//
//  SettingsViewController.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/16/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBAction func LogoutPressed(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        self.performSegue(withIdentifier: "Logout", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
