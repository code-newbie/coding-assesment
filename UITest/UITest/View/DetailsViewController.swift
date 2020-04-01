//
//  DetailsViewController.swift
//  UITest
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var pauseImageView: UIImageView!
    @IBOutlet weak var volumeImageView: UIImageView!
    var viewModel:   DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        let playPauseGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapPlay))
        pauseImageView.addGestureRecognizer(playPauseGestureRecognizer)
        pauseImageView.isUserInteractionEnabled = true
    }

    func setUI() {
        mainImageView.image = UIImage(named: viewModel?.coverImage ?? "default")
        songTitle.text = viewModel?.songTitle ?? "default"
        artist.text = viewModel?.artist ?? "default"
        pauseImageView.image = viewModel != nil && viewModel!.isPlay ? UIImage(systemName: "pause.fill") : UIImage(systemName: "play.fill")
        pauseImageView.layer.cornerRadius = pauseImageView.frame.size.width / 2
    }
    
    @objc func onTapPlay() {
        viewModel?.onTapPlay()
        setUI()
    }
}
