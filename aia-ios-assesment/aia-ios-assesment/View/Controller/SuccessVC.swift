//
//  SuccessVC.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 30/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class SuccessVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnBackToHomeOnClick() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
