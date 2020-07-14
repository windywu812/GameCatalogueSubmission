//
//  ListGameWithGenre.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 12/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation

struct ListGameWithGenreResponse: Codable {
    let count: Int
    let results: [DetailGame]
}
