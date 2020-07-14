//
//  UserDefaultServices.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class UserDefaultService {
        
    static private let nameKey = "name"
    static private let emailKey = "email"
    static private let phoneNumberKey = "phoneNumber"
    static private let educationKey = "education"
    static private let locationKey = "locationKey"
    static let photoProfileKey = "photoKey"
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    static var phoneNumber: String {
        get {
            return UserDefaults.standard.string(forKey: phoneNumberKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: phoneNumberKey)
        }
    }
    
    static var education: String {
        get {
            return UserDefaults.standard.string(forKey: educationKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: educationKey)
        }
    }
    
    static var location: String {
        get {
            return UserDefaults.standard.string(forKey: locationKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: locationKey)
        }
    }
    
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
    
}
