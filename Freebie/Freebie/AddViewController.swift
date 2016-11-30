//
//  AddViewController.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/29/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class AddViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var EventLocation: UITextField!
    @IBOutlet weak var EventInfo: UITextView!
    
    
    @IBAction func add(_ sender: Any) {
        
        let lat = locationManager.location?.coordinate.latitude
        let long = locationManager.location?.coordinate.longitude
        let user = FIRAuth.auth()?.currentUser
        
        let postedBy = user?.displayName
        let eventName = EventName.text
        let eventLoc = EventLocation.text
        let eventInfo = EventInfo.text
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss zzz"
        
        let timeStamp = dateFormatter.string(from: date as Date)
        
        createEvent(eventName: eventName!, eventLoc: eventLoc!, eventInfo: eventInfo!, postedBy: postedBy!, lat: lat!, long: long!, timeStamp: timeStamp)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func createEvent(eventName:String, eventLoc: String, eventInfo: String, postedBy: String, lat: CLLocationDegrees, long: CLLocationDegrees, timeStamp: String) {
        
        let freebieData = ["eventName": eventName as AnyObject, "eventLoc": eventLoc as AnyObject, "eventInfo": eventInfo as AnyObject, "postedBy": postedBy as AnyObject, "lat": lat as AnyObject, "long": long as AnyObject, "timeStamp": timeStamp as AnyObject]
        
        DataService.ds.REF_FREEBIES.childByAutoId().setValue(freebieData)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        EventInfo.delegate = self
        
        EventName.delegate = self
        EventLocation.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        
        EventName.layer.borderColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0).cgColor
        EventLocation.layer.borderColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0).cgColor
        EventInfo.layer.borderColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0).cgColor
        
        EventName.layer.borderWidth = 2.0
        EventLocation.layer.borderWidth = 2.0
        EventInfo.layer.borderWidth = 2.0
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))

        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        EventName.resignFirstResponder()
        EventLocation.resignFirstResponder()
        EventInfo.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            EventInfo.resignFirstResponder()
            return false
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
