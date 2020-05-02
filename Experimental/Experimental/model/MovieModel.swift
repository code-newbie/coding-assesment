//
//  MovieModel.swift
//  Experimental
//
//  Created by ogya 1 on 02/05/20.
//  Copyright © 2020 ogya 1. All rights reserved.
//

import Foundation

struct MovieModel : Decodable {
    let page : Int
    let results: [Result]
}

struct Result : Decodable {
    let id: Int
    let original_title : String
    let overview: String
    let poster_path: String
    let release_date: String
    var fetchPosterPatch: String {
        return "https://image.tmdb.org/t/p/w185\(poster_path)"
    }
}
