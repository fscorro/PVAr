//
//  Plan_de_vueloTests.swift
//  Plan de vueloTests
//
//  Created by Felipe Corro on 21/05/2018.
//  Copyright © 2018 Felipe Corro. All rights reserved.
//

import XCTest
@testable import Plan_de_vuelo

class Plan_de_vueloTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    // Confirm that the User initializer returns a User object when passed valid parameters.
    func testMealInitializationSucceeds() {
        
        let completeUser = User.init(licence: "Licence", email: "email@email", password: "123456")
        XCTAssertNotNil(completeUser)
    }
    
    // Confirm that the User initialier returns nil when passed an empty licence or email or password.
    func testMealInitializationFails() {
        // Empty licence
        let emptyLicenceUser = User.init(licence: "", email: "email@email", password: "123456")
        XCTAssertNil(emptyLicenceUser)
        
        // Empty email
        let emptyEmailUser = User.init(licence: "Licence", email: "", password: "123456")
        XCTAssertNil(emptyEmailUser)
        
        // Empty password
        let emptyPasswordUser = User.init(licence: "Licence", email: "email@email", password: "")
        XCTAssertNil(emptyPasswordUser)
    }
    
}
