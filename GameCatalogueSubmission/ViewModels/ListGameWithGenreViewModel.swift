//
//  ListGameWithGenreViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 12/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class ListGameWithGenreViewModel: ObservableObject {
    
    @Published var listGame = [DetailGame]()
    
    init(id: Int) {
        fetchData(id: id)
    }
    
    private func fetchData(id: Int) {
        ApiService().fetchListGamesWithGenre(id: String(id)) { (result) in
            switch result {
            case .success(let result):
                self.listGame = result.results
            case .failure(let error):
                print(error.localizedDescription)
                self.listGame = []
            }
        }
    }
    
}
