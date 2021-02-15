//
//  ViewController.swift
//  MapKitExample
//
//  Created by Angela Velilla on 15/02/2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserLocation()
        
        initMap()
        
        addAnnotation()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func getUserLocation() {
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    private func initMap() {
        let initLocation = CLLocation(latitude: 41.655900, longitude: -0.910166)
        
        mapView.centerLocation(initLocation)
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    private func addAnnotation() {
        let mdAnnotation = CLLocationCoordinate2D(latitude: 41.655900, longitude: -0.910166)
        
        let pin = CustomAnnotation(coor: mdAnnotation)
        pin.title = "Master D AV Navarra"
        
        self.mapView.addAnnotation(pin)
    }


}

// MARK: - Location Manager Delegate

extension ViewController: CLLocationManagerDelegate {
    
}


// MARK: - Map View Delegate

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.title != "My Location" {
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom pin")
            let markImage = UIImage(named: "mark")
            
            annotationView.image = markImage
            
            if let markImageOK = markImage {
                annotationView.centerOffset = CGPoint(x: 0, y: -markImageOK.size.height / 2)
            }
            
            annotationView.canShowCallout = true
            return annotationView
        }
        return nil
    }
}

// MARK: - EXTENSION MAPVIEW

private extension MKMapView {
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
