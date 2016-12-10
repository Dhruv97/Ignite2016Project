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

        loadFreebies()
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
    
    func loadFreebies() {
        
        DataService.ds.REF_FREEBIES.observe(.value, with:{ (snapshot) in
        
        
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshot {
                    
                    if let freebieDict = snap.value as? NSDictionary {
                        
                        let lat = freebieDict["lat"]
                        let long = freebieDict["long"]
                        let freebieLocation = CLLocation(latitude: lat as! CLLocationDegrees, longitude: long as! CLLocationDegrees)
                        let eventName = freebieDict["eventName"]
                        let eventInfo = freebieDict["eventInfo"]
                        let eventLoc = freebieDict["eventLoc"]
                        let postedBy = freebieDict["postedBy"]
                        
                        let anno = FreebieAnnotation(coordinate: freebieLocation.coordinate, info: eventInfo as! String?, location: eventLoc as? String, eventName: eventName as? String, postedBy: postedBy as? String)
                        
                        self.MapView.addAnnotation(anno)
                        
                    }
                    
                }
                
            }

        
        })
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annoIdentifier = "Freebie"
        var annoView: MKAnnotationView?
        
        if(!annotation.isKind(of: MKUserLocation.self)) {
            
            if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier) {
                annoView = deqAnno
                annoView?.annotation = annotation
            } else {
                let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
                av.leftCalloutAccessoryView = UIButton(type: .detailDisclosure)
                annoView = av
            }
        }
        
        if let annotationView = annoView,  let _ = annotation as? FreebieAnnotation {
            
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "anno.png")
            
             let btn = UIButton()
             btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
             btn.setImage(UIImage(named: "treasure-map"), for: .normal)
             annotationView.rightCalloutAccessoryView = btn

            
        }
        
        return annoView

        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let anno = view.annotation as? FreebieAnnotation {
            
            if control == view.leftCalloutAccessoryView {
            performSegue(withIdentifier: "Detail", sender: anno)
            } else {
            var place: MKPlacemark!
            
            if #available(iOS 10.0, *) {
                place = MKPlacemark(coordinate: anno.coordinate)
            } else {
                place = MKPlacemark(coordinate: anno.coordinate, addressDictionary: nil)
            }
            let dest = MKMapItem(placemark: place)
            dest.name = anno.eventName
            let regionDist: CLLocationDistance = 1000
            let regionSpan = MKCoordinateRegionMakeWithDistance(anno.coordinate, regionDist, regionDist)
            
            let options = [MKLaunchOptionsMapCenterKey: NSValue (mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span), MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] as [String : Any]
            
            MKMapItem.openMaps(with: [dest], launchOptions: options)

            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail" {
            
            if let detailVC = segue.destination as? DetailViewController {
                
                if let anno = sender as? FreebieAnnotation {
                    
                    detailVC.event = anno.eventName!
                    detailVC.info = anno.info!
                    detailVC.loc = anno.location!
                    detailVC.posted = anno.postedBy!
                    
                }
                
            }
            
        }
        
    }

}
