//
//  ContentView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSearching = false
    @State private var searchText: String = ""
    @State private var onProfile = false
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                GamesView()
                    .navigationBarTitle("Top Games")
            }.tabItem {
                VStack {
                    Image(systemName: "gamecontroller.fill")
                    Text("Top")
                }
            }
            
            NavigationView {
                GenreView()
                    .navigationBarTitle("Genres")
            }.tabItem {
                VStack {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("Genres")
                }
            }
            
            NavigationView {
                SearchView()
                    .navigationBarTitle("Search")
            }.tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            
            NavigationView {
                FavoriteView()
                    .navigationBarTitle("Favorites")
            }.tabItem {
                Image(systemName: "heart.fill")
                Text("Favorite")
            }
            
            NavigationView {
                ProfileView()
                    .navigationBarTitle("Profile")
            }.tabItem {
                Image(systemName: "person.circle.fill")
                Text("Profile")
            }
        
        }
    }
}
