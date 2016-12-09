//
//  FreebieCell.swift
//  Freebie
//
//  Created by Dhruv Upadhyay on 12/1/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit

class FreebieCell: UITableViewCell {
    
    var freebie: Freebie!
    
    @IBOutlet weak var eventName: UILabel!
    
    
    @IBOutlet weak var eventInfo: UITextView!


    @IBOutlet weak var eventLoc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(freebie: Freebie) {
        
        self.freebie = freebie
        eventName.text = freebie.eventName
        eventInfo.text = freebie.eventInfo
        eventLoc.text = freebie.eventLoc
        
    }
    
}
