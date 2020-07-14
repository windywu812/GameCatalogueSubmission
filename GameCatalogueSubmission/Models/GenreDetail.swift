//
//  GenreDetail.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct GenreDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let imageBackground: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageBackground = "image_background"
        case description
    }
}
