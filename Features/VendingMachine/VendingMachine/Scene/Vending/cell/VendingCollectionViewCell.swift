//
//  VendingCollectionViewCell.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Common
class VendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vendingImage: UIImageView!
    @IBOutlet weak var vendingTitle: UILabel!
    @IBOutlet weak var vendingPrice: UILabel!
    @IBOutlet weak var vendingStock: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
    }

}
