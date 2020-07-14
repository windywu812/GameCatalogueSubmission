////
////  CoreDataViewModel.swift
////  iOSFundamentalSubmission
////
////  Created by Windy on 13/07/20.
////  Copyright © 2020 Windy. All rights reserved.
////
//
//import SwiftUI
//
//class FavoriteViewModel: ObservableObject {
//
//    @Published var favoriteList = [DetailGame]()
//    @FetchRequest(entity: Favorite.entity(), sortDescriptors: []) private var favoriteList: FetchedResults<Favorite>
//
//    init(favoriteList: FetchedResults<Favorite>) {
//        fetchData(favoriteList: favoriteList)
//    }
//
//    private func fetchData(favoriteList: FetchedResults<Favorite>) {
//        favoriteList.forEach { (favorite) in
//            ApiService().fetchGameDetail(id: Int(favorite.id)) { (result) in
//                switch result {
//                case .success(let result):
//                    self.favoriteList.append(result)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//
//}
