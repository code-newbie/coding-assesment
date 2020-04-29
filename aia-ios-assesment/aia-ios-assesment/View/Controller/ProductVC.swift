//
//  ProductVC.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 30/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {
    
    @IBOutlet weak var lblTotalMoney: UILabel!
    @IBOutlet weak var lblTotalPurchase: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let productViewModel = ProductViewModel()
    
    internal var totalMoney: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTotalMoney.text = "Total Money: Rp\(totalMoney.formattedWithSeparator)"
        
        productViewModel.delegate = self
        productViewModel.totalMoney = totalMoney
    }
    
    @IBAction func btnChooseProcessOnClick() {
        if productViewModel.totalPurchased > 0 {
            let successVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "successVC") as? SuccessVC
            self.navigationController?.pushViewController(successVC!, animated: true)
        } else {
            Utility.showAlert(toController: self, withTitle: "Failed", withMessage: "Please choose your drinks!")
        }
    }
    
    
}

extension ProductVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
        cell?.lblName.text = "\(productViewModel.getProductForIndex(index: indexPath.row).name) (Rp\(productViewModel.getProductForIndex(index: indexPath.row).price.formattedWithSeparator)) - (\(productViewModel.getProductForIndex(index: indexPath.row).stock))"
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
    
}

extension ProductVC: ProductDelegate {
    func updateLabelTotalPurchase(text: String) {
        lblTotalPurchase.text = text
    }
    
    func updateTotalPurchase(cell: ProductCell, updateType: UpdateType, numberOfItem: Int) {
        let indextPath = tableView.indexPathForRow(at: cell.center)
        let product = productViewModel.getProductForIndex(index: indextPath!.row)
              
        productViewModel.updatePurchaseProduct(viewController: self, product: product, cell: cell, updateType: updateType, numberOfItem: numberOfItem)
    }
    
    
}
