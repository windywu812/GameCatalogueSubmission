//
//  DetailGameViewModel.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 08/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class DetailGameViewModel: ObservableObject {
        
    @Published var detailGame: DetailGame?
    
    init(id: Int) {
        self.fetchDetailData(id: id)
    }
    
    private func fetchDetailData(id: Int) {
        ApiService().fetchGameDetail(id: id) { (detailGame) in
            switch detailGame {
            case .success(let detailGame):
                self.detailGame = detailGame
            case .failure(let error):
                print(error)
                self.detailGame = nil
            }
        }
    }
}
