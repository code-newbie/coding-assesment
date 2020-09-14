//
//  VendingView.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

class VendingView: UIViewController, VendingPresenterToView {
    var presenter: VendingViewToPresenter?
    
    @IBOutlet weak var collectionView: UICollectionView!
    let className: String = String(describing: VendingView.self)
    let classCell: String = String(describing: VendingCollectionViewCell.self)
    let bundle = Bundle(for: VendingView.self)
    
    init() {
        super.init(nibName: className, bundle: Bundle(for: VendingView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        
    }
    
    func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: classCell, bundle: Bundle(for: VendingCollectionViewCell.self)), forCellWithReuseIdentifier: VendingScreenCellID.defaultCellID.rawValue)
        collectionView.reloadData()
    }
    
    func navigationBar() {
        navigationItem.title = Constants.titleNavigationBar
    }
}

extension VendingView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.vendingModel.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VendingScreenCellID.defaultCellID.rawValue, for: indexPath) as! VendingCollectionViewCell
        
        if let data = presenter?.vendingModel[indexPath.row] {
            cell.vendingTitle.text = data.title
            cell.vendingPrice.text = Constants.price+"\(data.price)".convertCurrentcy()
            cell.vendingStock.text = Constants.stock+"\(data.stock)"
            cell.vendingImage.image = UIImage(named: data.image, in: bundle, compatibleWith: nil)
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(dataModel: presenter?.vendingModel[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
