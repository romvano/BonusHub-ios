//
//  ViewController.swift
//  main client
//
//  Created by Daria Firsova on 12.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

@objcMembers class ViewController: UIViewController {

    @IBOutlet weak var menuBarButtonItem: UIBarButtonItem!
    
    var menuVC: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeRight.direction = .right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right")
            showMenu()
        case UISwipeGestureRecognizerDirection.left:
            print("Left")
            hideMenu()
        default: break
        }
    }
    
    @IBAction func menuBarButtonItem(_ sender: UIBarButtonItem) {
        if AppDelegate.isMenuVC {
            showMenu()
        } else {
            hideMenu()
        }
    }
    
    func showMenu() {
        UIView.animate(withDuration: 0.3) {
            self.menuVC.view.frame = CGRect (x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height)
            self.addChildViewController(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenuVC = false
        }
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuVC.view.frame = CGRect (x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height)
        }) { (finished) in
            self.menuVC.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
    }
    /* Вынести в отдельные классы и переделать во View!
     
     
     */
    /*
     
     */
    
}

