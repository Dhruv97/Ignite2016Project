//
//  FreebieAnnotation.swift
//  Freebie
//
//  Created by Dhruv Upadhyay on 12/9/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import Foundation
import MapKit

class FreebieAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    var title:  String?
    var info: String?
    var location: String?
    var eventName: String?
    var postedBy: String?
    
    init(coordinate: CLLocationCoordinate2D, info: String?, location: String?, eventName: String?, postedBy:String?) {
        
        self.coordinate = coordinate
        self.info = info
        self.location = location
        self.eventName = eventName
        self.title = eventName
        self.postedBy = postedBy
        
    }
}
