//
//  GameResponse.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct GameResponse: Codable {
    
    let count: Int
    let next: String?
    let previous: String?
    
    let listGames: [DetailGame]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case listGames = "results"
    }
    
}
