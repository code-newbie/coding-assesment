//
//  MusicListView.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

class MusicListView: UIViewController, MusicListPresenterToView {
    var presenter: MusicListViewToPresenter?
    
    @IBOutlet weak var collectionView: UICollectionView!
    let className: String = String(describing: MusicListView.self)
    let classCell: String = String(describing: MusicCollectionViewCell.self)
    let bundle = Bundle(for: MusicListView.self)
    
    init() {
        super.init(nibName: className, bundle: Bundle(for: MusicListView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        presenter?.viewDidload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
    }
    
    func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: classCell, bundle: Bundle(for: MusicCollectionViewCell.self)), forCellWithReuseIdentifier: defaultCellID)
        collectionView.reloadData()
    }
    
    func navigationBar() {
        navigationItem.title = defaultTitle
    }
}

extension MusicListView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.musicModel.count ?? .zero
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultCellID, for: indexPath) as! MusicCollectionViewCell
        if let data = presenter?.musicModel[indexPath.row] {
            cell.musicTrackName.text = data.name
            cell.musicArtist.text = data.artistName
            cell.musicImage.image = UIImage(named: data.imageName, in: bundle, compatibleWith: nil)
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(dataModel: presenter?.musicModel, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.bounds.width
        return CGSize(width: width/2 - 15, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
