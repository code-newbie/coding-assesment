//
//  DetailsViewModel.swift
//  UITest
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewModel: NSObject {
    var coverImage: String = ""
    var songTitle: String =  ""
    var artist: String = ""
    var isPlay: Bool = true
    
    init(albumModel: AlbumModel) {
        super.init()
        self.coverImage = albumModel.coverImage
        self.songTitle = albumModel.songTitle
        self.artist = albumModel.artist
    }
    
    func onTapPlay() {
        isPlay = !isPlay
    }
}
