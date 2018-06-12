//
//  User.swift
//  Plan de vuelo
//
//  Created by Felipe Corro on 29/05/2018.
//  Copyright © 2018 Felipe Corro. All rights reserved.
//

import UIKit

class User {
    
    //MARK: Properties
    
    var licence: String
    var email: String
    var password: String
    
    //MARK: Initialization
    
    init?(licence: String, email: String, password: String) {
        if licence.isEmpty || email.isEmpty || password.isEmpty {
            return nil
        }
        
        self.licence = licence
        self.email = email
        self.password = password
    }
}
