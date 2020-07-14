//
//  CoreDataViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 13/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class FavoriteViewModel: ObservableObject {

    @Published var favoriteDetailList = [DetailGame]()
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        CoreDataService.instance.fetchData { (favorites) in
            favorites.forEach { (favorite) in
                ApiService().fetchGameDetail(id: favorite.id) { (result) in
                    switch result {
                    case .success(let result):
                        self.favoriteDetailList.append(result)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

}
