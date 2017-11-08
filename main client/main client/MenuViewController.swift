//
//  MenuViewController.swift
//  main client
//
//  Created by Илья on 30.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    public let myTitle = ["User profile", "User places", "Map"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

    func tableView(_ tableVew: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTitle.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.labelText.text = myTitle[indexPath.row]
        return cell
    }

}
