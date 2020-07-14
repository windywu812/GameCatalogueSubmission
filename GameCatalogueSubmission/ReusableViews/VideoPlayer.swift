//
//  VideoPlayer.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 12/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoPlayer: UIViewControllerRepresentable {
    
    let player: AVPlayer?
    
    init(url: String) {
        player = AVPlayer(url: URL(string: url)!)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }

}

extension AVPlayerViewController {
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player?.pause()
    }
}
