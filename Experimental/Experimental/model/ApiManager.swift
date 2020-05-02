//
//  ApiManager.swift
//  Experimental
//
//  Created by ogya 1 on 02/05/20.
//  Copyright © 2020 ogya 1. All rights reserved.
//

import Foundation

protocol MovieManagerDelegate {
    func didUpdateMovie(movie: MovieModel)
}

protocol MovieManagerDetailDelegate {
    func didUpdateMovie(movie: Result)
}

struct Base {
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let api = "3da8902babab85c9ac30e837198e9bf9"
}

struct ApiManager {
    let url = "\(Base.baseUrl)discover/movie?api_key=\(Base.api)"
    var delegate : MovieManagerDelegate?
    var detailDelegate : MovieManagerDetailDelegate?
    
    func fetchData(){
        requestApi()
    }
    
    // List Movie
    func requestApi(){
        if let url = URL(string: self.url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let movie = self.parseJson(response: safeData){
                        self.delegate?.didUpdateMovie(movie: movie)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(response: Data) -> MovieModel?{
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(MovieModel.self, from: response)
            return data
        } catch {
            print(error)
            return nil
        }
        
    }
    
    // Detail Movie
    func requestDetailApi(_ id: Int){
        if let url = URL(string: "\(Base.baseUrl)movie/\(id)?api_key=\(Base.api)"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let movie = self.parseDetailJson(response: safeData){
                        self.detailDelegate?.didUpdateMovie(movie: movie)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseDetailJson(response: Data) -> Result?{
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(Result.self, from: response)
            return data
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    func fetDetailData(_ id: Int){
        requestDetailApi(id)
    }
}
