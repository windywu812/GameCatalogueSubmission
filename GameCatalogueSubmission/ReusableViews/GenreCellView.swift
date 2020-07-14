//
//  GenreCellView.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 12/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GenreCellView: View {
    
    var genre: GenreDetail
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: genre.imageBackground))
                .placeholder(content: {
                    ActivityIndicator()
                })
                .renderingMode(.original)
                .resizable()
                .frame(width: K.widthOfParentSize - 40, height: 212)
            Text(genre.name)
                .bold()
                .scaleFont(size: 22)
                .padding(.leading)
            Text(genre.description.clearTheString())
                .lineLimit(3)
                .padding(.bottom)
                .padding(.horizontal)
        }
        .foregroundColor(.primary)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
        .padding(.bottom)
    }
}
