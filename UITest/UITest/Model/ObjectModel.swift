//
//  ObjectModel.swift
//  UITest
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import Foundation

class ObjectModel: Decodable {
    var album: [AlbumModel]
    
    init(albums: [AlbumModel]) {
        self.album = albums
    }
}
