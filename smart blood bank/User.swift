//
//  User.swift
//  smart blood bank
//
//  Created by Syed Shahrukh Haider on 05/05/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import Foundation

struct User{
    static var filteredUsers = [User]()
    static var loginUser : User!
    
    var name: String
    var age : String
    var category : String
    var blood : String
}
