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
    func registerToken(token: String){
        UserDefaults.standard.set(token, forKey: Keys.userToken)
    }
    
    func getUserID() -> Int {
        let id = UserDefaults.standard.integer(forKey: Keys.userID)
            return id
    }
    
    func getUserToken() -> String? {
        let token = UserDefaults.standard.string(forKey: Keys.userToken)
            return token
    }
    
}

class Keys {
    
    static let username = "userName"
    static let userID = "userId"
    static let userToken = "userToken"
    
}
