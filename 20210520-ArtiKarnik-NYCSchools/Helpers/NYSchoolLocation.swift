//
//  helper.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/22/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit
import MapKit

class NYSchoolLocation: NSObject {
    // Method to get location coordinates, it will check for coordinate if its exists
    func getLocation(location: String) -> Double {
        guard let location = Double(location) else { return 0.0}
        return location
    }
    // convert location coordinates to CLLocationCoordinate2D
    func getcoordinated(latitude: String, longitude: String) -> CLLocationCoordinate2D {
        let latitude = getLocation(location: latitude)
        let longitude = getLocation(location: longitude)
        
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(latitude) ), longitude: CLLocationDegrees(Double(longitude) ))
           
       let CLLCoordType = CLLocationCoordinate2D(latitude: location.latitude,longitude: location.longitude)
        return CLLCoordType
    }
    // Create Annotation for map based on latitude, longitude and title 
    func createAnnotation(latitude: String, longitude: String, title: String) -> MKPointAnnotation {
        let annotation = MKPointAnnotation();
         annotation.coordinate = getcoordinated(latitude: latitude, longitude: longitude)
         annotation.title = title
         
        return annotation
    }
}
