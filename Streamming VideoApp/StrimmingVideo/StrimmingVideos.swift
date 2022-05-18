//
//  StrimmingVideo.swift
//  StrimmingVideo
//
//  Created by Sina Taherkhani on 8/27/1400 AP.
//

import Foundation
import AVKit
import AVFoundation
public class StrimmingVideoPlayer{
    private let PlayerViewController = AVPlayerViewController()
    private let avPlayer = AVPlayer()
    private lazy var PlayerView:UIView = {
        let view = PlayerViewController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public init() {}
    public func add (view:UIView){
        view.addSubview(PlayerView)
        NSLayoutConstraint.activate([
            PlayerView.topAnchor.constraint(equalTo: view.topAnchor),
            PlayerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            PlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            PlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    public func play (url:URL){
        let playerItems = AVPlayerItem(url: url)
        avPlayer.replaceCurrentItem(with: playerItems)
        PlayerViewController.player = avPlayer
        PlayerViewController.player?.play()
    }
    public func puase (){
        avPlayer.pause()
    }
}
