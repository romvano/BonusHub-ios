//
//  Maps.swift
//  main client
//
//  Created by Daria Firsova on 04.11.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class mapsVievController: UIViewController {
    
    override func loadView() {

        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.map = mapView
    
}
}
