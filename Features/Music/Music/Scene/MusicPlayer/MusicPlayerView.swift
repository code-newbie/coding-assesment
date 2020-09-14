//
//  MusicPlayerView.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayerView: UIViewController, MusicPlayerPresenterToView {
    
    var presenter: MusicPlayerViewToPresenter?
    let className: String = String(describing: MusicPlayerView.self)
    let bundle = Bundle(for: MusicPlayerView.self)
    
    init() {
        super.init(nibName: className, bundle: Bundle(for: MusicPlayerView.self))
    }
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var audioPlayer : AVPlayer!
    var isPlaying: Bool = true
    public var position: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
    }
  
    func configure() {
        // set up player
        let data = presenter?.dataModel?[position]
        guard let trackName = data?.trackName, let imageName = data?.imageName,
            let name = data?.name, let artistName = data?.artistName
            else {return}
        
        trackNameLabel.text = name
        artistNameLabel.text = artistName
        musicImage.image =  UIImage(named: imageName, in: bundle, compatibleWith: nil)
        guard let url = URL(string: trackName) else {
            print("error to get the mp3 file")
            return
        }
        do {
            audioPlayer = AVPlayer(url: url as URL)
        }
        audioPlayer?.play()
    }
    
    @IBAction func didTapBackButton() {
        if position > 0 {
            position = position - 1
            configure()
        }
    }
    
    @IBAction func didTapNextButton() {
        if position < ((presenter?.dataModel?.count)! - 1) {
            position = position + 1
            configure()
        }
    }
    
    
    @IBAction func didTapPlayPauseButton() {
        if isPlaying == true {
            // pause
            isPlaying = false
            audioPlayer?.pause()
            //playButton.setBackgroundImage(UIImage(.play), for: .normal)
            if #available(iOS 13.0, *) {
                let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
                let boldSearch = UIImage(systemName: "play", withConfiguration: boldConfig)
                playButton.setImage(boldSearch, for: .normal)
            } else {
                // Fallback on earlier versions
            }
        }
        else {
            // play
            isPlaying = true
            audioPlayer?.play()
            if #available(iOS 13.0, *) {
                let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
                let boldSearch = UIImage(systemName: "pause", withConfiguration: boldConfig)
                playButton.setImage(boldSearch, for: .normal)
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    @IBAction func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        audioPlayer?.volume = value
    }
    
}
