//
//  AllTimeGameViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class AllTimeGameViewModel: ObservableObject {
    
    @Published var listGames = [DetailGame]()
    
    init() {
        fetchListGames()
    }
    
    private func fetchListGames() {
        ApiService().fetchListGames(dates: "2010-01-01,2020-12-31", ordering: "-rating") { (gameResponse) in
            switch gameResponse {
            case .success(let result):
                self.listGames = result.listGames
            case .failure(let error):
                print(error)
                self.listGames = []
            }
        }
    }
    
}
