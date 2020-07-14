//
//  GenreViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class GenreViewModel: ObservableObject {
    
    @Published var detailGenre = [GenreDetail]()
    
    private var listGenre = [Genre]()

    init() {
        fetchData()
    }
    
    private func fetchData() {
        ApiService().fetchGenre { (response) in
            switch response {
            case .success(let response):
                self.listGenre = response.results
                self.listGenre.forEach { (genre) in
                    ApiService().fetchGenreDetail(id: genre.id) { (response) in
                        switch response {
                        case .success(let response):
                            self.detailGenre.append(response)
                        case .failure(let error):
                            print(error)
                            self.detailGenre = []
                        }
                    }
                }
            case .failure(let error):
                print(error)
                self.listGenre = []
            }
        }
        
    }
    
}
