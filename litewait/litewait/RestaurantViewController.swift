//
//  RestaurantViewController.swift
//  litewait
//
//  Created by Joseph Ho on 10/9/18.
//  Copyright © 2018 dumplingNinjas. All rights reserved.
//

import UIKit
import MapKit

class RestaurantViewController: UIViewController, CLLocationManagerDelegate{
    
    private let locationManager = CLLocationManager()
    private var previousPoint: CLLocation?
    private var totalMovementDistance: CLLocationDistance = 0

    @IBOutlet var map: MKMapView!
    
    
    var food:String = ""
    
    //Authorization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Authoization status changed to \(status.rawValue)")
        switch status {
        case .authorized, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            map.showsUserLocation = true
        default:
            locationManager.stopUpdatingLocation()
            map.showsUserLocation = false
        }
    }
    
/*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = (locations as [CLLocation])[locations.count - 1]
        
        let latitudeString = String(format: "%g\u{00B0}", newLocation.coordinate.latitude)
        Latitude.text = latitudeString
        
        let longtitudeString = String(format: "%g\u{00B0}", newLocation.coordinate.longitude)
        Longitude.text = longtitudeString
    }
 */
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let centerLocation = CLLocationCoordinate2DMake(37.396650, -122.061409)
        let mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        let mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.map.setRegion(mapRegion, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(food)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
