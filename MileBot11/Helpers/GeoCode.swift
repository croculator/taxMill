//
//  GeoCode.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/20/21.
//

import SwiftUI
import MapKit

class GeoCode {
    func reverseGeocode(location: CLLocation, handler: @escaping ((String?) -> Void)) {
      CLGeocoder().reverseGeocodeLocation(location) {
            places,err in

            if err != nil {
                print("geocoder error")
                handler(nil)
                return
            }
            let placeMark1: CLPlacemark? = places!.last
            print(placeMark1?.name)
            handler(placeMark1?.name)
        }
    }
    
    
}
