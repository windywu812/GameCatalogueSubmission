//
//  SearchView.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 09/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var searchListGame = SearchGameViewModel()
    @ObservedObject var listGame = ListGameViewModel()
        
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Enter game title", text: self.$searchListGame.searchText) {
                    self.searchListGame.fetchListGames()
                }
            }
            .padding(8)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            
            if !searchListGame.isSearching {
                if !searchListGame.listGame.isEmpty {
                    VStack(alignment: .leading) {
                        ForEach(searchListGame.listGame) { game in
                            NavigationLink(destination: DetailGameView(id: game.id)) {
                                ListCellView(game: game)
                            }
                        }
                    }
                    .padding(.top, 8)
                } else {
                    if !listGame.listGames.isEmpty {
                        VStack(alignment: .leading) {
                            ForEach(listGame.listGames) { game in
                                NavigationLink(destination: DetailGameView(id: game.id)) {
                                    ListCellView(game: game)
                                }
                            }
                        }
                        .padding(.top, 8)
                    } else {
                        ActivityIndicator()
                            .padding()
                    }
                }
            } else {
                ActivityIndicator()
                    .padding()
            }
            
        }
        .padding(.horizontal, 20)
        .onTapGesture(perform: { UIApplication.shared.endEditing() })
       
        .alert(isPresented: $searchListGame.isNotFound) {
            Alert(title: Text("Not Found"), message: Text("Please enter different title"), dismissButton: .default(Text("Okay"))
            )
        }
    }
}
