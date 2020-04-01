//
//  CollectionCellViewModel.swift
//  UITest
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import Foundation

class CollectionCellViewModel: NSObject {
    var coverImage: String = ""
    var songTitle: String =  ""
    var artist: String = ""
    var isFavourite: Bool = false
    
    init(albumModel: AlbumModel) {
        self.coverImage = albumModel.coverImage
        self.songTitle = albumModel.songTitle
        self.artist = albumModel.artist
    }
    
    func onTapFavourite() {
        isFavourite = !isFavourite
    }
}
