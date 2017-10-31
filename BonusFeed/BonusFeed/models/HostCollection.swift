//
//  HostCollection.swift
//  BonusFeed
//
//  Created by Admin on 13.10.17.
//  Copyright © 2017 BonusHub. All rights reserved.
//

import UIKit

class HostCollection {
    var hosts: [HostModel]
    
    init() {
        self.hosts = []
    }
    
    func fetch() {
        // TODO здесь будет код, который забирает с сервера массив хостов. См. API /api/client/list_hosts/
    }
}
