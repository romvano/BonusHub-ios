//
//  UserAPI.swift
//  main client
//
//  Created by Admin on 30.10.17.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit
import Alamofire

class UserAPI {
    let USER_URL = API.BASE_URL + "user/"

    
    func login(login: String!, pwd: String!, onResult: @escaping(Int?, UserModel?) -> Void) {
        /*
         * Returns:
         *     (nil, nil), (200, nil), (400, nil) if request failed
         *     (403, nil) if auth failed (wrong credentials)
         *     (200, UserModel) if auth ok
         */
        
        let params: Parameters = [
            "login": login,
            "password": pwd
        ]
        Alamofire.request(USER_URL + "login/", method: .post, parameters: params).responseJSON { response in
            guard response.result.error == nil else {
                onResult(nil, nil)
                return
            }
            
            let code = response.response?.statusCode
            guard code == API.OK else {
                onResult(response.response!.statusCode, nil)
                return
            }
            
            let data = response.result.value as? NSDictionary
            let user_uid = data?.object(forKey: "user_id") as! String?
            let user = UserModel(uid: user_uid!, login: login)
            user?.saveLocally()
            onResult(code, user)
        }
    }
    
    func register(login: String!, pwd: String!, onResult: @escaping(Int?) -> Void) {
        
    }
}