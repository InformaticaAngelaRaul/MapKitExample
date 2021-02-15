//
//  CustomAnnotation.swift
//  MapKitExample
//
//  Created by Angela Velilla on 15/02/2021.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coor: CLLocationCoordinate2D) {
        coordinate = coor
    }
}
