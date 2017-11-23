//
//  MyProfileViewController.swift
//  main client
//
//  Created by Admin on 15.11.17.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var QRCodeImageView: UIImageView!
    @IBOutlet weak var IdLabel: UILabel!
    
    private func onGetInfoResult (code: Int?, user: UserModel?) {
        if code == API.OK && user != nil {
            self.render(id: user!.uid)
            return
        }
        
        if code == API.NOT_AUTHED {
            // переход на экран логина + очистка кеша (cleanRealm())
            
            cleanRealm()
            return
        }
        
        // if not 200 and not 401 - try to load from local storage
        let loadedUser: UserModel? = UserModel.load()
        if loadedUser != nil {
            self.render(id: loadedUser!.uid)
            return
        }
        
        // if local storage doesn't contain a user model - login screen
        // aпереход на экран логина + очистка кеша
        
        cleanRealm()
    }
    
    private func render(id: String) {
        IdLabel.text = id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClientAPI().getClientInfo(onResult: self.onGetInfoResult) // aхер с ним, пусть будет так
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Загрузить картинку QRcode с сервера
    // Записать id с сервера (стоит костыль в 19 строке)

}
