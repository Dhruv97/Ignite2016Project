//
//  ListViewController.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/16/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var freebiesArr = [Freebie]()

    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self

        loadFreebies()
        print("FREEBIES: \(freebiesArr.count)")

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freebiesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let freebie = freebiesArr[indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FreebieCell {
            
            
            cell.configureCell(freebie: freebie)
            
            return cell
            
        } else {
            
            return FreebieCell()
            
        }
        
    }
    
    func loadFreebies() {
        
        DataService.ds.REF_FREEBIES.observe(.value, with:  { (snapshot) in
        
            var tempFreebiesArr = [Freebie]()
            tempFreebiesArr = []
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshot {
                    
                    if let freebieDict = snap.value as? NSDictionary {
                        
                        print("KEY: \(snap.key)")
                        let freebieKey = snap.key
                        let freebie = Freebie(freebieKey: freebieKey, freebieData: freebieDict as! Dictionary<String, AnyObject>)
                        print("\(freebie.postedBy)")
                        tempFreebiesArr.append(freebie)
                        
                    }
                    
                }
                
            }
            self.freebiesArr = tempFreebiesArr
            self.TableView.reloadData()
        })
        
    }
    
}
