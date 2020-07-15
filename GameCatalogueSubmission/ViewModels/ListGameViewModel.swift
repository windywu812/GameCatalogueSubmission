//
//  ListGameViewModel.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class ListGameViewModel: ObservableObject {
    
    @Published var listGames = [DetailGame]()
    
    init() {
        fetchListGames()
    }
        
    private func fetchListGames() {
        ApiService().fetchListGames(ordering: "-added") { (gameResponse) in
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
