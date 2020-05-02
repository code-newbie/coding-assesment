//
//  HomeViewController.swift
//  Experimental
//
//  Created by ogya 1 on 02/05/20.
//  Copyright © 2020 ogya 1. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func listAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goList", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func arrayAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goArray", sender: nil)
    }
}
