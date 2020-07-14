//
//  ActivityIndicator.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 11/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
    
}
