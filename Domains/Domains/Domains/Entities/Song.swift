//
//  Song.swift
//  Domains
//
//  Created by ILHAM on 12/09/20.
//

import Foundation
public struct Song {
    public var name: String
    public var albumName: String
    public var artistName: String
    public var imageName: String
    public var trackName: String
    public init(name: String, albumName: String, artistName: String, imageName: String, trackName: String) {
        self.name = name
        self.albumName = albumName
        self.artistName = artistName
        self.imageName = imageName
        self.trackName = trackName
    }
}
