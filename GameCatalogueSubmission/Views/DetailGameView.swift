//
//  DetailView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct DetailGameView: View {
    
    @ObservedObject private var detailViewModel: DetailGameViewModel
    @State private var showMore: Bool = false
    
    var isFavorite: Bool
    
    init(id: Int, isFavorite: Bool = false) {
        detailViewModel = DetailGameViewModel(id: id)
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(detailViewModel.detailGame?.name ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    WebImage(url: URL(string: detailViewModel.detailGame?.backgroundImage ?? ""))
                        .placeholder(content: {
                            ActivityIndicator()
                        })
                        .resizable()
                        .frame(width: K.widthOfParentSize - 40, height: 212)
                        .cornerRadius(15)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Rating")
                                .foregroundColor(.secondary)
                                .bold()
                                .font(.subheadline)
                            RatingView(rating: detailViewModel.detailGame?.rating ?? 0, size: 17)
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Released")
                                .foregroundColor(.secondary)
                                .bold()
                                .font(.subheadline)
                            Text(detailViewModel.detailGame?.releaseDate ?? "-")
                                .bold()
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Age")
                                .foregroundColor(.secondary)
                                .bold()
                                .font(.subheadline)
                            Text(detailViewModel.detailGame?.age?.name ?? "-")
                                .bold()
                        }
                    }.padding(.top)
                    if detailViewModel.detailGame?.clip != nil {
                        VStack(alignment: .leading) {
                            Text("Gameplay")
                                .bold()
                            VideoPlayer(url: detailViewModel.detailGame?.clip!.clip ?? "")
                                .frame(width: K.widthOfParentSize - 40, height: 220)
                                .cornerRadius(15)
                        }.padding(.vertical, 16)
                    }
                    VStack(alignment: .leading) {
                        if self.detailViewModel.detailGame?.description != nil {
                            Text("About")
                                .fontWeight(.bold)
                                .padding(.vertical, 8)
                            Text("\((detailViewModel.detailGame?.description!.clearTheString()) ?? "")")
                                .lineLimit(self.showMore == false ? 4 : nil)
                            if self.showMore == false {
                                Button(action: {
                                    withAnimation {
                                        self.showMore = true
                                    }
                                }) {
                                    Text("More")
                                }
                            }
                        }
                    }.padding(.bottom)
                }
                VStack(alignment: .leading, spacing: 8) {
                    VStack {
                        if detailViewModel.detailGame?.releaseDate != nil {
                            HStack {
                                Text("Release date")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\((detailViewModel.detailGame?.releaseDate!.changeDateFormat()) ?? "")")
                            }
                        }
                        if detailViewModel.detailGame?.rating != nil {
                            Divider()
                            HStack {
                                Text("Rating")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\(Double((detailViewModel.detailGame?.rating) ?? 0), specifier: "%.2f")")
                            }.padding(.vertical, 4)
                        }
                    }
                    if detailViewModel.detailGame?.genres != nil {
                        Divider()
                        HStack(alignment: .top) {
                            Text("Genre")
                                .foregroundColor(.secondary)
                            Spacer()
                            VStack(alignment: .trailing) {
                                ForEach(((detailViewModel.detailGame?.genres ?? []))) { genre in
                                    Text("\(genre.name)")
                                }
                            }
                        }.padding(.vertical, 4)
                    }
                    if detailViewModel.detailGame?.age != nil {
                        Divider()
                        HStack {
                            Text("Age Rating")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\((detailViewModel.detailGame?.age?.name) ?? "")")
                        }.padding(.vertical, 4)
                    }
                    VStack {
                        if detailViewModel.detailGame?.developers != nil {
                            Divider()
                            HStack(alignment: .top) {
                                Text("Developer")
                                    .foregroundColor(.secondary)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    ForEach(((detailViewModel.detailGame?.developers) ?? [])) { developer in
                                        Text("\(developer.name)")
                                    }
                                }
                            }.padding(.vertical, 4)
                        }
                        if detailViewModel.detailGame?.publishers != nil {
                            Divider()
                            HStack(alignment: .top) {
                                Text("Publisher")
                                    .foregroundColor(.secondary)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    ForEach(detailViewModel.detailGame?.publishers ?? []) { publisher in
                                        Text("\(publisher.name)")
                                    }
                                }
                            }.padding(.vertical, 4)
                        }
                        if detailViewModel.detailGame?.website != "" {
                            Divider()
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Website")
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Button(action: {
                                        if let url = URL(string: self.detailViewModel.detailGame?.website ?? "") {
                                            UIApplication.shared.open(url)
                                        }
                                    }) {
                                        Text(self.detailViewModel.detailGame?.website ?? "")
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, -50)
        }
        .animation(.default)
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing:
            Button(action: {
                if let detail = self.detailViewModel.detailGame {
                    CoreDataService().saveData(
                        id: detail.id,
                        name: detail.name ?? "",
                        rating: detail.rating ?? 0,
                        backgroundImage: detail.backgroundImage ?? "",
                        releasedDate: detail.releaseDate ?? "")
                    HapticFeedback().simpleHaptic()
                }
            }, label: {
                Text(self.isFavorite ? "" : "Add to favorite")
            })
        )
    }
}


