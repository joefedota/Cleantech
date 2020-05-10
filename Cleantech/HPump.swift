//
//  HPump.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/16/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Pump: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(fromLoc location:CLLocationCoordinate2D, withName stationName:String) {
        self.coordinate = location
        self.title = stationName
    }
    var markerTintColor: UIColor  {
      switch title {
      case "Hydrogen Pump":
        return .green
      case "Destination":
        return .red
      default:
        return .green
      }
    }
    var glyph: String  {
      switch title {
      case "Hydrogen Pump":
        return "H"
      case "Destination":
        return "D"
      default:
        return "H"
      }
    }
}
