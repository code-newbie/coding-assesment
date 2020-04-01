//
//  CollectionViewCell.swift
//  UITest
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var favouriteImageView: UIImageView!
    var viewModel: CollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
        let favouriteGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapFavourite))
        favouriteImageView.addGestureRecognizer(favouriteGestureRecognizer)
        favouriteImageView.isUserInteractionEnabled = true
    }
    
    func setUI() {
        cover.image = UIImage(named: viewModel?.coverImage ?? "default")
        songTitle.text = viewModel?.songTitle ?? "default"
        artist.text = viewModel?.artist ?? "default"
        favouriteImageView.image = viewModel != nil && viewModel!.isFavourite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
    
    @objc func  onTapFavourite() {
        viewModel?.onTapFavourite()
        setUI()
    }
}
