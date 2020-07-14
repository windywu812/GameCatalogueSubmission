//
//  FavoriteCell.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteCell: View {
    
    var game: Favorite
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: URL(string:
                    game.backgroundImage ?? ""))
                    .resizable()
                    .placeholder(content: {
                        ActivityIndicator()
                    })
                    .renderingMode(.original)
                    .frame(width: 156, height: 108)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(game.name ?? "")
                        .bold()
                    RatingView(rating: game.rating, size: 15)
                    Text(game.releasedDate?.changeDateFormat() ?? "")
                        .font(.subheadline)
                    Text("Details")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        .padding(.top, 4)
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 8)
            }
        }.padding(.vertical, 8)
    }
}
