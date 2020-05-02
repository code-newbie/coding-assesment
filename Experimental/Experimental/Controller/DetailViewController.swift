//
//  DetailViewController.swift
//  Experimental
//
//  Created by ogya 1 on 02/05/20.
//  Copyright © 2020 ogya 1. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, MovieManagerDetailDelegate {
    
    @IBOutlet weak var imgDetail: UIImageView!
    var apiManager = ApiManager()
    
    @IBOutlet weak var txtTitle: UILabel!
    
    @IBOutlet weak var txtDetail: UILabel!
    var imageName: String!
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         apiManager.detailDelegate = self
        
        if let tmpId = id {
            apiManager.fetDetailData(tmpId)
        }
    }
    
    func didUpdateMovie(movie: Result){
        DispatchQueue.main.async {
            if let url = URL(string: movie.fetchPosterPatch){
                self.imgDetail.load(url: url)
            }
            self.txtTitle.text = movie.original_title
            self.txtDetail.text = movie.overview
        }
       
    }
}
