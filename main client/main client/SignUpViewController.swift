//
//  SignUpViewController.swift
//  main client
//
//  Created by Илья on 30.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var createLoginField: UITextField! //связывает с полем ввода логина
    @IBOutlet weak var createPassword1Field: UITextField! //связывает с полем ввода пароля 1
    @IBOutlet weak var createPassword2Field: UITextField! //связывает с полем ввода пароля 2
    @IBOutlet var createAccount: UIButton!  // TODO
    //On Daria
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTapGestureRecognized(_ sender: Any) { //закрывает клавиатуру при тапе по экрану
        createLoginField.resignFirstResponder()
        createPassword1Field.resignFirstResponder()
        createPassword2Field.resignFirstResponder()
    }
    // On Daria
}
