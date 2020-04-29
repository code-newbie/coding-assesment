//
//  VendingMachineVC.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 29/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class VendingMachineVC: UIViewController {

    @IBOutlet weak var lblTotalMoney: UILabel!
    let vendingMachineViewModel = VendingMachineViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.isTranslucent = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func btnChooseDrinkOnClick() {
        if vendingMachineViewModel.currentMoney > 0 {
            let productVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "productVC") as? ProductVC
            productVC!.totalMoney = vendingMachineViewModel.currentMoney
            self.navigationController?.pushViewController(productVC!, animated: true)
        } else {
            Utility.showAlert(toController: self, withTitle: "Failed", withMessage: "You have no money. Please insert your money first!")
        }
    }
    
    @IBAction func btnChooseRefreshOnClick() {
        vendingMachineViewModel.currentMoney = 0
        lblTotalMoney.text = "Total: Rp0"
    }
    
    
}

extension VendingMachineVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachineViewModel.getNumberOfNominal()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moneyCell", for: indexPath) as? MoneyCell
        cell?.lblName.text = vendingMachineViewModel.getNominalForIndex(index: indexPath.row).display
              
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lblTotalMoney.text = vendingMachineViewModel.updateMoney(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0 - 8
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    
}
