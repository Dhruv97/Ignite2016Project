//
//  MapViewController.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/16/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    @IBOutlet weak var MapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.delegate = self
        MapView.userTrackingMode = MKUserTrackingMode.follow

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Center(_ sender: Any) {
        let location = self.MapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        self.MapView.setRegion(region, animated: true)
    }
    func locationAuth() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            MapView.showsUserLocation = true
        }
        else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.locationAuth()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
