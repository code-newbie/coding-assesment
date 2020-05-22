//
//  ListCell.swift
//  AIA
//
//  Created by keenOI on 23/05/20.
//  Copyright © 2020 keen. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {
    let photoImageView = UIImageView()
    let viewTitle = UIView()
    let titleLabel = UILabel()
    
    var arrayData: ArrayData? {
        didSet {
            guard let photo = arrayData?.image else { return }
            guard let title = arrayData?.title else { return }
            photoImageView.image = UIImage(named: photo)
            titleLabel.text = title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bindData()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ListCell {
    fileprivate func bindData() {
        setLibrary()
        setAnchor()
    }
}

extension ListCell {
    fileprivate func setLibrary() {
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        
        viewTitle.backgroundColor = #colorLiteral(red: 0.3283385967, green: 0.3123716768, blue: 0.3339944948, alpha: 0.5343584947)
        viewTitle.layer.cornerRadius = 15
        
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    fileprivate func setAnchor() {
        addSubview(photoImageView)
        photoImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        addSubview(viewTitle)
        viewTitle.setAnchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.width, height: 30)
        
        viewTitle.addSubview(titleLabel)
        titleLabel.setAnchor(top: viewTitle.topAnchor, left: viewTitle.leftAnchor, bottom: viewTitle.bottomAnchor, right: viewTitle.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
    }
}
