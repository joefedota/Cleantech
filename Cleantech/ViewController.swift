//
//  ViewController.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/15/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var stateController:StateController?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var pumps : [Pump] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.stateController = appDelegate.stateController
        
        //set center of map
        let initialLocation = CLLocation(latitude: 36.281927, longitude: -120.272055)
        mapView.centerToLocation(initialLocation)
        
        //set frame
        let region = MKCoordinateRegion(center: initialLocation.coordinate,latitudinalMeters: 10000000, longitudinalMeters: 10000000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 10000000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        //Show own location
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        }
        //Annotate map
        mapView.register(MarkerView.self, forAnnotationViewWithReuseIdentifier:
        MKMapViewDefaultAnnotationViewReuseIdentifier)
        let pumpLocs = Parser().latlongs()
        for loc in pumpLocs {
            let ploc = CLLocationCoordinate2D(latitude: loc[0], longitude: loc[1])
            let newPump = Pump(fromLoc: ploc, withName: "Hydrogen Pump")
            pumps.append(newPump)
            mapView.addAnnotation(newPump)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Get route from statecontroller and show route trace
        //hardcoded 2302 coordinates 37.869346, -122.252585
        let home = CLLocationCoordinate2D(latitude: 37.869346, longitude: -122.252585)
        
        if (stateController!.realRoute) {
            let sourcePlacemark = MKPlacemark(coordinate: locationManager.location!.coordinate, addressDictionary: nil)
            let destinationPlacemark = MKPlacemark(coordinate: closestPump(lat: home.latitude, long: home.longitude), addressDictionary: nil)

            let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

            let sourceAnnotation = MKPointAnnotation()

            if let location = sourcePlacemark.location {
                sourceAnnotation.coordinate = location.coordinate
            }

            let destinationAnnotation = MKPointAnnotation()

            destinationAnnotation.coordinate = home
            
            self.mapView.showAnnotations([Pump(fromLoc: home, withName: "Destination")], animated: true)

            
            let directionRequest = MKDirections.Request()
            directionRequest.source = sourceMapItem
            directionRequest.destination = destinationMapItem
            directionRequest.transportType = .automobile

            // Calculate the direction
            let directions = MKDirections(request: directionRequest)

            directions.calculate {
                (response, error) -> Void in

                guard let response = response else {
                    if let error = error {
                        print("Error: \(error)")
                    }

                    return
                }

                let route = response.routes[0]

                self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)

                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        let renderer = MKPolylineRenderer(overlay: overlay)

        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)

        renderer.lineWidth = 5.0

        return renderer
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
      guard let pump = view.annotation as? Pump else {
        return
      }

      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
      ]
      let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: pump.coordinate))
      mapItem.openInMaps(launchOptions: launchOptions)
    }
    func closestPump(lat : Double, long : Double) -> CLLocationCoordinate2D {
        var closest : CLLocationCoordinate2D = self.pumps[0].coordinate
        var leastDist : Double = 100000.0
        //let clat : Double = locationManager.location!.coordinate.latitude
        //let clong : Double = locationManager.location!.coordinate.longitude
        for pump in self.pumps {
            let plat : Double = pump.coordinate.latitude
            let plong : Double = pump.coordinate.longitude
            let euclidD : Double = sqrt(pow((lat - plat), 2.0) + pow((long - plong), 2.0))
            if (euclidD <= leastDist) {
                closest = pump.coordinate
                leastDist = euclidD
            }
        }
        return closest
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 800000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

