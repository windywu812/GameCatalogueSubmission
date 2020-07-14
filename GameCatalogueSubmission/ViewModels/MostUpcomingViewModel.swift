//
//  MostUpcomingViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class MostUpcomingViewModel: ObservableObject {
    
    @Published var listGames = [DetailGame]()
    var title: String = "Most Upcoming"
    
    init() {
        fetchListGames()
    }
    
    private func fetchListGames() {
        ApiService().fetchListGames(dates: "2019-10-10,2020-10-10", ordering: "-added") { (gameResponse) in
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
