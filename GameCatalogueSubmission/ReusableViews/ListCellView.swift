//
//  ListCellView.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 09/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCellView: View {
    
    var game: DetailGame
        
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
                    RatingView(rating: game.rating ?? 0, size: 15)
                    Text(game.releaseDate?.changeDateFormat() ?? "")
                        .font(.subheadline)
                    Text("Details")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        .padding(.top, 4)
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 8)
            }
            Divider()
                .padding(.vertical, 4)
                .padding(.bottom, 2)
        }
        
    }
}
