//
//  DetailGame.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 04/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct DetailGame: Codable, Identifiable {
    
    let id: Int
    let name: String?
    let description: String?
    let releaseDate: String?
    let website: String?
    var rating: Double?
    let developers: [Developer]?
    let genres: [Genre]?
    let age: Age?
    let platforms: [Platform]?
    let backgroundImage: String?
    let publishers: [Publisher]?
    let shortScreenshots: [Screenshot]?
    let clip: Clip?
        
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case releaseDate = "released"
        case website
        case rating
        case developers
        case genres
        case age = "esrb_rating"
        case platforms = "parent_platforms"
        case backgroundImage = "background_image"
        case publishers = "publishers"
        case shortScreenshots = "short_screenshots"
        case clip
    }
    
    struct Developer: Codable, Identifiable {
        let id: Int
        let name: String
    }
    
    struct Genre: Codable, Identifiable {
        let id: Int
        let name: String
    }
    
    struct Platform: Codable, Identifiable {
        let id: Int?
        let name: String?
    }
    
    struct Age: Codable, Identifiable {
        let id: Int
        let name: String
    }
    
    struct Publisher: Codable, Identifiable {
        let id: Int
        let name: String
    }
    
    struct Screenshot: Codable, Identifiable {
        let id: Int
        let image: String
    }
    
    struct Clip: Codable {
        let clip: String
    }
    
}
