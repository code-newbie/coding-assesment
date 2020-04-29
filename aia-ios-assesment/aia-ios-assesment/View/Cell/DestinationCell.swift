//
//  DestinationCell.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 29/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class DestinationCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
    
    func configureCell(destination: Destination) {
        imgIcon.image = UIImage(named: destination.image)
        lblName.text = destination.name
        lblDescription.text = destination.description
    }
    
    
}
