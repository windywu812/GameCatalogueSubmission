//
//  SearchGameViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class SearchGameViewModel: ObservableObject {
    
    @Published var listGame = [DetailGame]()
    @Published var searchText: String = ""
    @Published var isNotFound: Bool = false
    @Published var isSearching: Bool = false
    
    init() {
        fetchListGames()
    }
    
    func fetchListGames() {
        if !searchText.isEmpty {
            isSearching = true
            ApiService().fetchListGames(search: self.searchText) { (result) in
                switch result {
                case .success(let result):
                    self.listGame = result.listGames
                    self.isSearching = false
                    if self.listGame.isEmpty {
                        self.listGame = []
                        self.isNotFound.toggle()
                        self.searchText = ""
                        self.isSearching = false
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    self.listGame = []
                    self.isNotFound.toggle()
                    self.searchText = ""
                    self.isSearching = false
                }
            }
        } else {
            self.listGame = []
        }
    }
    
}
