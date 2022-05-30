//
//  Cache.swift
//  ChatGraphQl
//
//  Created by Azizbek Salimov on 30.05.2022.
//

import Foundation

class Cache {
    
    static let shared = Cache()
    
    func registerUser(username: String, userID: Int) {
        UserDefaults.standard.set(username, forKey: Keys.username)
        UserDefaults.standard.set(userID, forKey: Keys.userID)
    }
    
    func getUserID() -> Int {
        let id = UserDefaults.standard.integer(forKey: Keys.userID)
            return id
    }
    
}

class Keys {
    
    static let username = "userName"
    static let userID = "userId"
    
}
