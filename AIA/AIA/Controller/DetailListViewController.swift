//
//  DetailListViewController.swift
//  AIA
//
//  Created by keenOI on 23/05/20.
//  Copyright © 2020 keen. All rights reserved.
//

import UIKit

class DetailListViewController: UIViewController {
    let imageView = UIImageView()
    var detailsData: ArrayData? {
        didSet {
            guard let photo = detailsData?.image else { return }
            imageView.image = UIImage(named: photo)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}

extension DetailListViewController {
    fileprivate func bindData() {
        bindUI()
        setAnchor()
    }
}

extension DetailListViewController {
    fileprivate func bindUI() {
        navigationItem.title = detailsData?.title
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    fileprivate func setAnchor() {
        view.addSubview(imageView)
        imageView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
