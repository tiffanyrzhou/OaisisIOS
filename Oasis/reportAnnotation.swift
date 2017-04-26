//
//  reportAnnotation.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/26/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import Foundation
import Foundation
import MapKit
import Contacts

class reportAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, subtitle: String) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.subtitle = subtitle;
        super.init()
}
    func pinTintColor() -> UIColor  {
        switch discipline {
        case "Water Source Report":
            return MKPinAnnotationView.redPinColor()
        case "Water Quality Report":
            return MKPinAnnotationView.purplePinColor()
        default:
            return MKPinAnnotationView.greenPinColor()
        }
    }

}
