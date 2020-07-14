//
//  DetailGenre.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 12/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GenreDetailView: View {
    
    @ObservedObject var listGame: ListGameWithGenreViewModel
    @State private var showMore: Bool = false
    var genre: GenreDetail
    
    init(genre: GenreDetail) {
        self.genre = genre
        self.listGame = ListGameWithGenreViewModel(id: genre.id)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: genre.imageBackground))
                    .placeholder(content: {
                        ActivityIndicator()
                    })
                    .resizable()
                    .frame(width: K.widthOfParentSize - 40, height: 212)
                    .cornerRadius(15)
                    .padding(.top, 8)
                Text(genre.description.clearTheString())
                    .lineLimit(self.showMore ? nil : 5)
                    .padding(.top, 8)
                if !showMore {
                    Button(action: {
                        withAnimation {
                            self.showMore.toggle()
                        }
                    }) {
                        Text("Show more")
                    }
                }
            }.padding(.trailing, 20)
            if !listGame.listGame.isEmpty {
                VStack(alignment: .leading) {
                    HStack {
                       Text("Games")
                        .bold()
                        .scaleFont(size: 20)
                        Spacer()
                        NavigationLink(destination: SeeAllView(listGames: self.listGame.listGame, title: "All games")) {
                            Text("See All")
                        }
                    }.padding(.trailing, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(self.listGame.listGame) { game in
                                NavigationLink(destination: DetailGameView(id: game.id)) {
                                    VStack(alignment: .leading, spacing: 0) {
                                        WebImage(url: URL(string: game.backgroundImage!))
                                            .resizable()
                                            .renderingMode(.original)
                                            .placeholder(content: {
                                                ActivityIndicator()
                                            })
                                            .frame(width: K.widthOfParentSize / 1.6, height: 162)
                                        HStack {
                                            Text("\(game.name ?? "")")
                                                .bold()
                                                .padding()
                                        }
                                        .foregroundColor(.primary)
                                    }
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                }.padding(.top)
            } else {
                ActivityIndicator()
            }
            
        }
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .navigationBarTitle(genre.name)
    }
}
