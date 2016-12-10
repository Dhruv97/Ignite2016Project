//
//  DetailViewController.swift
//  Freebie
//
//  Created by Dhruv Upadhyay on 12/9/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var eventLoc: UILabel!
    @IBOutlet weak var eventInfo: UITextView!
    @IBOutlet weak var eventName: UILabel!
    
    var event = ""
    var loc = ""
    var info = ""
    var posted = ""
    
    @IBOutlet weak var postedBy: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       eventLoc.text = "Location: \(loc)"
        eventName.text = event
        eventInfo.text = info
        postedBy.text = "Posted by: \(posted)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func close(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
