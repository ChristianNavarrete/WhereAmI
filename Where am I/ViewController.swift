//
//  ViewController.swift
//  Where am I
//
//  Created by HoodsDream on 4/6/15.
//  Copyright (c) 2015 HoodsDream. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    var manager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        //grab the users location from the locations array
        var userLocation:CLLocation = locations[0] as CLLocation
        
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            if (error != nil) {
                println(error)
            }
                if let p = CLPlacemark(placemark:placemarks?[0] as CLPlacemark!) {
                    
                    println(p)
                    
                    var subThoroughfare:String = ""
                    
                    if (p.subThoroughfare != nil) {
                        
                        subThoroughfare = p.subThoroughfare
                        
                    }
                    
                    self.addressLabel.text = "\(p.subThoroughfare) \(p.thoroughfare) \n \(p.subAdministrativeArea) \n ( \(p.subLocality) ) \n \(p.postalCode) \n \(p.country)"
                }
            
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

