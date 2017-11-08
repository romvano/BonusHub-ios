//
//  HostArrayModel.swift
//  main client
//
//  Created by Admin on 03.11.17.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class HostArrayModel {
    var hostArray: List<HostModel>
    
    init (arr: List<HostModel>) {
        self.hostArray = List<HostModel>()
        for el in arr {
            self.hostArray.append(el)
        }
    }
    
    func saveLocally() {
        
    }
}
