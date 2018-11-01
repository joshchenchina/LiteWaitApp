//
//  RestaurantViewController.swift
//  litewait
//
//  Created by Joseph Ho on 10/9/18.
//  Copyright © 2018 dumplingNinjas. All rights reserved.
//

import UIKit
import MapKit

class RestaurantViewController: UIViewController,

    CLLocationManagerDelegate{
    
    private let locationManager = CLLocationManager()
    private var previousPoint: CLLocation?
    private var totalMovementDistance: CLLocationDistance = 0

    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var waitLabel: UILabel!
    @IBOutlet var map: MKMapView!
    
    var uwt:String = ""
    
    var restaurantName:String = ""
    var waitName:String = ""
    var locationX: Double = 0
    var locationY: Double = 0
    
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
    override func viewDidLayoutSubviews() {
        print("Y Location \(locationY)")
    }
    
    
    @IBAction func submitTime(_ sender: Any) {
        performSegue(withIdentifier: "WaitTime", sender: self)
        
    }
    
    @IBAction func getDirections(_ sender: Any) {
       
        let coordinates = CLLocationCoordinate2DMake(locationX, locationY)
       // let regionSpan = MKCoordinateRegionMake(coordinates, MKCoordinateSpanMake(0.01, 0.02))
        
//        let options = [
//            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
//            MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving
//        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(restaurantName)"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
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

        restaurantLabel?.text = restaurantName
        waitLabel?.text = waitName
        let centerLocation = CLLocationCoordinate2DMake(37.4105, -122.0598)
        let mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        let mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.map.setRegion(mapRegion, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(restaurantName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindhere(segue:UIStoryboardSegue) {
        let comingFrom = segue.source as! SubmitWaitTimeViewController
        //uwt = String(comingFrom.waittime)
        let uwt = Int(comingFrom.waittime)
        waitLabel.text = String(uwt)
    }
    
    

}
