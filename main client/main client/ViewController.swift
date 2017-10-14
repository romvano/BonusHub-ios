//
//  ViewController.swift
//  main client
//
//  Created by Daria Firsova on 12.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterLoginField: UITextField!
    @IBOutlet weak var enterPasswordField: UITextField!
    @IBOutlet weak var createLoginField: UITextField! //связывает с полем ввода логина
    
    @IBOutlet weak var createPassword1Field: UITextField! //связывает с полем ввода пароля 1
    
    @IBOutlet weak var createPassword2Field: UITextField! //связывает с полем ввода пароля 2
    @IBAction func TapRecognizer(_ sender: Any) {
        enterPasswordField.resignFirstResponder()
        enterLoginField.resignFirstResponder()
    }
    @IBAction func onTapGestureRecognized(_ sender: Any) { //закрывает клавиатуру при тапе по экрану
        createLoginField.resignFirstResponder()
        createPassword1Field.resignFirstResponder()
        createPassword2Field.resignFirstResponder()
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

