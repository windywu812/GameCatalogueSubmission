//
//  GenreView.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 09/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GenreView: View {
    
    @ObservedObject var genreViewModel = GenreViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(genreViewModel.detailGenre) { genre in
                NavigationLink(destination: GenreDetailView(genre: genre)) {
                    GenreCellView(genre: genre)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
