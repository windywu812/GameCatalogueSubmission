//
//  ContentView.swift
//  RatingView
//
//  Created by Windy on 08/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    var rating: CGFloat = 0
    var space: CGFloat = 0
    var size: CGFloat = 0
    
    init(rating: Double, size: Double) {
        if rating >= 4 {
            self.space = 16
        } else if rating >= 3  && rating < 4 {
            self.space = 12
        } else if rating >= 2 && rating < 3 {
            self.space = 8
        } else if rating >= 1  && rating < 2 {
            self.space = 4
        } else if rating < 1 {
            self.space = 0
        }
        self.rating = CGFloat(rating)
        self.size = CGFloat(size)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 4) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: self.size, height: self.size)
                        .foregroundColor(.yellow)
                }
            }
            Rectangle()
                .frame(width: (((self.rating / 5)) * size * 5) + space, height: size)
                .foregroundColor(.yellow)
                .mask(
                    HStack(spacing: 4) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: self.size, height: self.size)
                        }
                    }
            )
        }
    }
}
