//
//  FavoriteView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

extension Favorite: Identifiable {}

struct FavoriteView: View {
    
    @ObservedObject var favoriteViewModel = FavoriteViewModel()
    
    var body: some View {
        VStack {
            if favoriteViewModel.favoriteDetailList.isEmpty {
                Text("No Favorites")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .bold()
            } else {
                List {
                    ForEach(favoriteViewModel.favoriteDetailList) { favorite in
                        ZStack {
                            NavigationLink(destination: DetailGameView(id: favorite.id)) {
                                ListCellView(game: favorite)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
            }
        }
        .navigationBarItems(trailing: EditButton())
    }
    
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}

