//
//  Freebie.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/30/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import Foundation
import Firebase
import MapKit

class Freebie {
    private var _eventName: String!
    private var _eventLoc: String!
    private var _eventInfo: String!
    
    private var _postedBy: String!
    private var _lat: CLLocationDegrees!
    private var _long: CLLocationDegrees!
    private var _timeStamp: String!
    private var _freebieKey: String!
    private var _freebieRef: FIRDatabaseReference!
    
    var eventName: String {
        return _eventName
    }
    
    var eventLoc: String {
        return _eventLoc
    }
    
    var eventInfo: String {
        return _eventInfo
    }
    
    var postedBy: String {
        return _postedBy
    }
    
    var lat: CLLocationDegrees {
        return _lat
    }
    
    var long: CLLocationDegrees {
        return _long
    }
    
    var timeStamp: String {
        return _timeStamp
    }
    
    var freebieKey: String {
        return _freebieKey
    }
    
    init (eventName:String, eventLoc: String, eventInfo: String, postedBy: String, lat: CLLocationDegrees, long: CLLocationDegrees, timeStamp: String) {

        self._eventName = eventName
        self._eventLoc = eventLoc
        self._eventInfo = eventInfo
        self._postedBy = postedBy
        self._lat = lat
        self._long = long
        self._timeStamp = timeStamp
        
        //_freebieRef = DataService.ds.REF_FREEBIES.child(_freebieKey)
        
    } 
    
    init (freebieKey: String, freebieData: Dictionary<String, AnyObject>) {
        self._freebieKey = freebieKey
        
        if let eventName = freebieData["eventName"] as? String {
            self._eventName = eventName
        }
        
        if let eventLoc = freebieData["eventLoc"] as? String {
            self._eventLoc = eventLoc
        }
        
        if let eventInfo = freebieData["eventInfo"] as? String {
            self._eventInfo = eventInfo
        }
        
        if let postedBy = freebieData["postedBy"] as? String {
            self._postedBy = postedBy
        }
        
        if let lat = freebieData["lat"] as? CLLocationDegrees {
            self._lat = lat
        }
        
        if let long = freebieData["long"] as? CLLocationDegrees {
            self._long = long
        }
        
        if let timeStamp = freebieData["timeStamp"] as? String {
            self._timeStamp = timeStamp
        }
        
        _freebieRef = DataService.ds.REF_FREEBIES.child(_freebieKey)
    }
    
}
