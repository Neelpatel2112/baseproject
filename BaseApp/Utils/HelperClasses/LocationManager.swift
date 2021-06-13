//
//  LocationManager.swift
//  Dilango-Rider
//
//  Created by Jenish on 11/03/21.
//  Copyright © 2021 PC. All rights reserved.
//

import UIKit
import CoreLocation

@objc protocol LocationUpdateProtocol : AnyObject{
    
    func locationDidUpdateToLocation(Newlocation : CLLocation,oldlocation:CLLocation?)
    @objc optional func locationDidUpdateDirection(location:CLLocation?,Heading:CGFloat)
}

/// Notification on update of location. UserInfo contains CLLocation for key "location"
let kLocationDidChangeNotification = "LocationDidChangeNotification"
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let SharedManager = LocationManager()
    lazy private var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    var previousLocation : CLLocation?
    weak var delegate : LocationUpdateProtocol?
    var Heading: CGFloat = 0
    private override init () {
        super.init()
        
        switch CLLocationManager.authorizationStatus() {
        
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            ShowLocationPopUp ()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        @unknown default:
            break
        }
        
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled()
        {
            self.locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.allowsBackgroundLocationUpdates = false
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
            
            if CLLocationManager.headingAvailable()
            {
                locationManager.startUpdatingHeading()
            }
        }
    }
    func ShowLocationPopUp () {
        
        let alertController = UIAlertController(title: "", message: "Please go to Settings and turn on the permissions", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        switch(CLLocationManager.authorizationStatus()) {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorize.")
        // get the user location
        case .notDetermined, .restricted, .denied:
            if let topVC = UIApplication.topViewController() {
                topVC.present(alertController, animated: true, completion: nil)
            }
        @unknown default:
            break
        }
    }
    func radiansToDegress(radians: CGFloat) -> CGFloat {
        return radians * 90 / CGFloat(Double.pi)
    }
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        previousLocation = currentLocation
        currentLocation = locations.first
        let userInfo : NSDictionary = ["location" : currentLocation!]
        DispatchQueue.main.async {
            self.delegate?.locationDidUpdateToLocation(Newlocation: self.currentLocation ?? CLLocation(latitude: 0, longitude: 0), oldlocation: self.previousLocation)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kLocationDidChangeNotification), object: self, userInfo: userInfo as [NSObject : AnyObject])
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let direction = newHeading.magneticHeading
        let radians = -direction / 90 * .pi
        let angle = self.radiansToDegress(radians: CGFloat(radians))
        Heading = angle
        delegate?.locationDidUpdateDirection?(location:manager.location,Heading:Heading)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            ShowLocationPopUp()
        case .authorizedAlways:
            print("authorizedAlways")
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        @unknown default:
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
