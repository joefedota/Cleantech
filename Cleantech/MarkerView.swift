//
//  MarkerView.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/16/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import Foundation
import MapKit

class MarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let pump = newValue as? Pump else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      // 2
        markerTintColor = pump.markerTintColor
        glyphText = pump.glyph
    }
  }
}
