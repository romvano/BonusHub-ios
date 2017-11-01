//
//  UserModel.swift
//  main client
//
//  Created by ivan on 28.10.17.
//  Copyright © 2017 Ivan Romanov. All rights reserved.
//

import UIKit
import Alamofire

let OBJECT_ID_LENGTH = 24

class UserModel {
    var uid: String!
    var login: String!
    
    init? (uid: String!, login: String!) {
        if !isObjectId(s: uid) {
            return nil
        }
        self.uid = uid
        self.login = login
    }
    
    func fetch() {
        
    }
    
    func saveLocally() {
        
    }
}