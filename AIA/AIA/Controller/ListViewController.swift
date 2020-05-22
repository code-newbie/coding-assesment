//
//  ListViewController.swift
//  AIA
//
//  Created by keenOI on 23/05/20.
//  Copyright © 2020 keen. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var collectionView: UICollectionView!
    let listCell = "listCell"
    
    let arrayData = [ArrayData(image: "pict1", title: "Animal 1"),
                     ArrayData(image: "pict2", title: "Animal 2"),
                     ArrayData(image: "pict3", title: "Animal 3"),
                     ArrayData(image: "pict4", title: "Animal 4"),
                     ArrayData(image: "pict5", title: "Animal 5"),
                     ArrayData(image: "pict6", title: "Animal 6"),
                     ArrayData(image: "pict7", title: "Animal 7"),
                     ArrayData(image: "pict8", title: "Animal 8"),
                     ArrayData(image: "pict1", title: "Animal 9"),
                     ArrayData(image: "pict2", title: "Animal 10"),
                     ArrayData(image: "pict3", title: "Animal 11"),
                     ArrayData(image: "pict4", title: "Animal 12"),
                     ArrayData(image: "pict5", title: "Animal 13"),
                     ArrayData(image: "pict6", title: "Animal 14"),
                     ArrayData(image: "pict7", title: "Animal 15"),
                     ArrayData(image: "pict9", title: "Animal 16")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}

extension ListViewController {
    fileprivate func bindData() {
        setNav()
        setCollectionView()
        setRegister()
        setAnchor()
    }
}
extension ListViewController {
    fileprivate func setNav() {
        view.backgroundColor = UIColor.white
        navigationItem.title = "List Data"
    }
    
    fileprivate func setCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
    }
    
    fileprivate func setRegister() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: listCell)
    }
    
    fileprivate func setAnchor() {
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCell, for: indexPath) as! ListCell
        cell.arrayData = arrayData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailListViewController()
        detail.detailsData = arrayData[indexPath.item]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 5
        let cellSpacing: CGFloat = 5
        return CGSize(width: (width / numberOfColumns) - (xInsets + cellSpacing), height: (width / numberOfColumns) - (xInsets + cellSpacing))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
