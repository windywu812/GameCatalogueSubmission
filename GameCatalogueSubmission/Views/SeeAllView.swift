//
//  SeeAllView.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct SeeAllView: View {
    
    var listGames = [DetailGame]()
    var title: String = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(listGames) { game in
                NavigationLink(destination: DetailGameView(id: game.id)) {
                    ListCellView(game: game)
                }
            }
        }
        .padding(20)
        .navigationBarTitle("\(title)", displayMode: .inline)
    }
}

struct SeeAllView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllView()
    }
}
