//
//  UserDefaultServices.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation

class UserDefaultService {
    
    private let userDefault = UserDefaults.standard
    
    private let nameKey = "name"
    
    var name: String {
        get {
            userDefault.string(forKey: nameKey) ?? ""
        }
        set {
            userDefault.set(newValue, forKey: nameKey)
        }
    }
    
    func createNew(label: String, description: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(description, forKey: label)
    }
    
}
