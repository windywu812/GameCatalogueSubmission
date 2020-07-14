//
//  HCellView.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 09/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct HCellView: View {
    
    var game: DetailGame
    var size: CGSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WebImage(url: URL(string: game.backgroundImage ?? ""))
                .resizable()
                .renderingMode(.original)
                .placeholder(content: {
                    ActivityIndicator()
                })
                .frame(width: size.width, height: size.height)
            HStack {
                Text(game.name ?? "")
                    .bold()
                    .padding()
            }
            .foregroundColor(.primary)
        }
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
    
}
