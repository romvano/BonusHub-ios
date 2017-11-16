//
//  Maps.swift
//  main client
//
//  Created by Daria Firsova on 16.11.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit
import MapKit


class MapsViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.007, 0.007) // увеличение карты
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(55.771101, 37.691433)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
