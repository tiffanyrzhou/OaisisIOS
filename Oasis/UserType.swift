//
//  UserType.swift
//  Oasis
//
//  Created by Tiffany Zhou on 3/3/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import Foundation
enum  UserType :String{
    case Worker = "Worker"
    case Reporter = "Reporter"
    case Manager = "Manager"
    case Adminstator = "Adminstator"
    var description : String {
        return self.rawValue;
    }
}


