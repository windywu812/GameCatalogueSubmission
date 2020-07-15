//
//  CoreDataViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 13/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import UIKit

class ProfileViewModel: ObservableObject {
    
    @Published var name: String = UserDefaultService.name
    @Published var email: String = UserDefaultService.email
    @Published var phoneNumber: String = UserDefaultService.phoneNumber
    @Published var education: String = UserDefaultService.education
    @Published var location: String = UserDefaultService.location
    
    func updateProfile() {
        UserDefaultService.name = self.name
        UserDefaultService.email = self.email
        UserDefaultService.phoneNumber = self.phoneNumber
        UserDefaultService.education = self.education
        UserDefaultService.location = self.location
        
        UserDefaultService.synchronize()
    }
    
    func savePic(image: UIImage, key: String) {
        if let pngRepresentation = image.pngData() {
            UserDefaults.standard.set(pngRepresentation, forKey: key)
        }
    }
    
    func getPic(forKey key: String) -> UIImage {
        if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
            let image = UIImage(data: imageData) {
            return image
        }
        return UIImage(named: "dummy")!
    }
    
}
