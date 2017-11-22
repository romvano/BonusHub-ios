//
//  PlacesViewController.swift
//  main client
//
//  Created by Admin on 15.11.17.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Прикрутить карты
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "") {
            let destController = segue.destination as? MapsViewController
            destController?.flag = true
        }
    }
}
