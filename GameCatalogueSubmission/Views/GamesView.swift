//
//  GamesView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GamesView: View {
    
    @ObservedObject var bestOfYear = BestOfTheYearViewModel()
    @ObservedObject var mostUpcoming = MostUpcomingViewModel()
    @ObservedObject var allTimeGame = AllTimeGameViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Best of the year")
                        .bold()
                        .scaleFont(size: 20)
                    Spacer()
                    NavigationLink(destination: SeeAllView(listGames: bestOfYear.listGames, title: bestOfYear.title)) {
                        Text("See All")
                    }
                }
                    .padding(.trailing, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(bestOfYear.listGames) { game in
                            NavigationLink(destination: DetailGameView(id: game.id)) {
                                HCellView(game: game, size: CGSize(width: K.widthOfParentSize - 40, height: 180))
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Most Upcoming")
                        .bold()
                        .scaleFont(size: 20)
                    Spacer()
                    NavigationLink(destination: SeeAllView(listGames: mostUpcoming.listGames, title: mostUpcoming.title)) {
                        Text("See All")
                    }
                }.padding(.top)
                    .padding(.trailing, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(mostUpcoming.listGames) { game in
                            NavigationLink(destination: DetailGameView(id: game.id)) {
                                HCellView(game: game, size: CGSize(width: K.widthOfParentSize / 1.6, height: 162))
                            }
                        }
                    }
                    
                }.padding(.bottom)
                
                HStack {
                    Text("Top Games from 2010")
                        .bold()
                        .scaleFont(size: 20)
                    Spacer()
                }.padding(.trailing, 20)
                
                ForEach(allTimeGame.listGames) { game in
                    NavigationLink(destination: DetailGameView(id: game.id)) {
                        ListCellView(game: game)
                    }
                }.padding(.trailing, 20)
            }
        }.padding(.leading, 20)
    }
}
