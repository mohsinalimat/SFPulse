//
//  ViewController.swift
//  SFPulse
//
//  Created by Stefano Frosoni on 14/03/2016.
//  Copyright © 2016 Stefano Frosoni. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    fileprivate let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()

        let latitude = 53.338219
        let longitude = -6.259087
        centerMapOnLocation(CLLocation(latitude: latitude, longitude: longitude))
        let mapAnnotation = MapAnnotation.init(coordinate: CLLocationCoordinate2DMake(latitude, longitude), title: "")
        mapView.addAnnotation(mapAnnotation)
    }

    fileprivate func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if annotation.isKind(of: MapAnnotation.self) {

            guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MapAnnotationView.identifier) else {
                let mapAnnotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: MapAnnotationView.identifier)
                return mapAnnotationView
            }
            annotationView.annotation = annotation
            return annotationView
        }

        return nil
    }
}

