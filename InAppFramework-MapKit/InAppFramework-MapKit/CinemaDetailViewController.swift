//
//  CinemaDetailViewController.swift
//  InAppFramework-MapKit
//
//  Created by Fenta on 2020/10/22.
//

import UIKit
import MapKit

class CinemaDetailViewController: UIViewController {
    
    var param = NSDictionary()
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        navigationItem.title = param["상영관명"] as? String
        
        let location = CLLocationCoordinate2D(latitude: (param["위도"] as! NSString).doubleValue,
                                              longitude: (param["경도"] as! NSString).doubleValue)
        let regionRadius = CLLocationDistance(500)
        let coordinateRegion = MKCoordinateRegion(center: location,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
        let cinema = MKPointAnnotation()
        cinema.coordinate = location
        mapView.addAnnotation(cinema)
    }
}
