//
//  HostModel.swift
//  BonusFeed
//
//  Created by Ivan on 13.10.17.
//  Copyright © 2017 BonusHub. All rights reserved.
//

import UIKit

let CUP_LOYALITY: Int = 0
let PERCENT_LOYALITY: Int = 1

let AVAILABLE_LOYALITIES: Set = [CUP_LOYALITY, PERCENT_LOYALITY]

class HostModel {
    var uid: String
    var title: String
    var description: String?
    var address: String?
    var timeOpen: NSDate?
    var timeClose: NSDate?
    var profileImage: String?
    var points: Float
    var loyalityType: Int
    var loyalityParam: Int?
    
    init?(uid: String, title: String, description: String?, address: String?, timeOpen: NSDate?, timeClose: NSDate?,
          profileImage: String?, points: Float, loyalityType: Int, loyalityParam: Int?) {
        // validation
        if title.isEmpty || points < 0 || !AVAILABLE_LOYALITIES.contains(loyalityType) {
            return nil
        }
        
        self.uid = uid
        self.title = title
        self.description = description
        self.address = address
        self.timeOpen = timeOpen
        self.timeClose = timeClose
        self.profileImage = profileImage
        self.points = points
        self.loyalityType = loyalityType
        self.loyalityParam = loyalityParam
    }
    
    
}

