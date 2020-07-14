//
//  GenreResponse.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct GenreResponse: Codable {
    let count: Int
    let results: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
}
