//
//  ViewController.swift
//  main client
//
//  Created by Daria Firsova on 12.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterPasswordField: UITextField!  //связывает с полем ввода логина
    @IBOutlet weak var enterLoginField: UITextField!
    
    
   
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        enterPasswordField.resignFirstResponder()
        enterLoginField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

