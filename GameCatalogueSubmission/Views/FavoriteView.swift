//
//  FavoriteView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteView: View {
        
    @FetchRequest(entity: Favorite.entity(), sortDescriptors: []) var favorites: FetchedResults<Favorite>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            if favorites.isEmpty {
                Text("No Favorites")
                    .font(.title)
                    .foregroundColor(.secondary)
            } else {
                List {
                    ForEach(favorites) { favorite in
                        ZStack(alignment: .leading) {
                            FavoriteCell(game: favorite)
                            NavigationLink(destination: DetailGameView(id: Int(favorite.id), isFavorite: true)) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.onDelete(perform: deleteFavorite)
                }
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func deleteFavorite(at offsets: IndexSet) {
        for offset in offsets {
            let favorite = favorites[offset]
            moc.delete(favorite)
        }
        try? moc.save()
    }
    
}
