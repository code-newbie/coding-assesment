//
//  merapiControllerView.swift
//  interview-project
//
//  Created by Aritio modernland on 04/03/22.
//

import Foundation
import UIKit

class merapiViewController: UIViewController {
    @IBOutlet weak var btnKembali: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnKembali(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
}
