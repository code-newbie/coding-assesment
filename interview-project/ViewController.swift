//
//  ViewController.swift
//  interview-project
//
//  Created by Aritio modernland on 04/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnTugas1: UIButton!
    
    @IBOutlet weak var btnTugas2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTugas1(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
    

    @IBAction func btnTugas2(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "tugasViewController") as! tugasViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
    
}

