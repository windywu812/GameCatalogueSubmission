//
//  TopGameModel.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 04/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class BestOfTheYearViewModel: ObservableObject {
    
    @Published var listGames = [DetailGame]()
    let title = "Best of the year"
    
    init() {
        fetchListGames()
    }
    
    private func fetchListGames() {
        ApiService().fetchListGames(dates: "2020-01-01,2020-12-31", ordering: "-rating") { (gameResponse) in
            switch gameResponse {
            case .success(let result):
                self.listGames = result.listGames
            case .failure(let error):
                print(error.localizedDescription)
                self.listGames = []
            }
        }
    }
    
}

