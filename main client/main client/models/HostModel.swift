//
//  HostModel.swift
//  main client
//
//  Created by Admin on 02.11.17.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class HostModel {
    var uid: String
    var title: String
    var description: String?
    var address: String?
    var latitude: Float64?
    var longitude: Float64?
    var offer: String?
    var timeOpen: Date?
    var timeClose: Date?
    var profileImage: NSURL?
    var points: Float
    var loyalityType: Int
    var loyalityParam: Int
    
    init? (uid: String?, title: String?, description: String?, address: String?,
           latitude: Float64?, longitude: Float64?, offer: String?,
           timeOpen: Date?, timeClose: Date?, profileImage: NSURL?,
           points: Float?, loyalityType: Int?, loyalityParam: Int?) {
        guard isObjectId(s: uid), title != nil, points != nil, loyalityType != nil, loyalityParam != nil else {
            return nil
        }
        self.uid = uid!
        self.title = title!
        self.description = description
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.offer = offer
        self.timeOpen = timeOpen
        self.timeClose = timeClose
        self.profileImage = profileImage
        self.points = points!
        self.loyalityType = loyalityType!
        self.loyalityParam = loyalityParam!
    }
    
    func saveLocally() {
        
    }
}
