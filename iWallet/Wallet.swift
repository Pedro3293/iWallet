//
//  Wallet.swift
//  iWallet
//
//  Created by Pedro3293 on 17/3/17.
//  Copyright © 2017 Pedro3293. All rights reserved.
//

import UIKit
import Foundation

class Wallet : NSObject {
    var name : String
    var money : Double
    var image : UIImage?
    var id: Int
    var history : [String] = []
    
    
    
    init(name: String, money: Double, id: Int){
        self.name = name
        self.money = money
        self.id = id
    }
}
