//
//  DestinationVC.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 29/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class DestinationVC: UIViewController {

    let destinationViewModel = DestinationViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.isTranslucent = false
        
    }


}

extension DestinationVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return destinationViewModel.getNumberOfDestination()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "destinationCell", for: indexPath) as? DestinationCell
        cell?.configureCell(destination: destinationViewModel.getDestinationForIndex(index: indexPath.row))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailDestinationVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailDestinationVC") as? DetailDestinationVC
        detailDestinationVC?.destination = destinationViewModel.getDestinationForIndex(index: indexPath.row)
        self.navigationController?.pushViewController(detailDestinationVC!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0
        let yourHeight = yourWidth + 50.0

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
}
