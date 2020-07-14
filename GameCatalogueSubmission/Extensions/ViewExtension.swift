//
//  ViewExtension.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 13/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

extension View {
    func scaleFont(size: CGFloat) -> some View {
        return self.modifier(ScaleFont(size: size))
    }
}
