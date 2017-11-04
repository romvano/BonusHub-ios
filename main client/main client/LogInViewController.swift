//
//  LogInViewController.swift
//  main client
//
//  Created by Илья on 30.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var enterLoginField: UITextField!
    @IBOutlet weak var enterPasswordField: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var createNewAccountButton: UIButton!
    // On Daria
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func OnTapGestureRecognizer(_ sender: Any) {
        enterLoginField.resignFirstResponder()
        enterPasswordField.resignFirstResponder()
    } // On Daria

}
