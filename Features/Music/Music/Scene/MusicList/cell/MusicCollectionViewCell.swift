//
//  MusicCollectionViewCell.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//

import UIKit
import CommonUIKit

class MusicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var musicArtist: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicTrackName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = CommonUIConstant.five
    }

}
