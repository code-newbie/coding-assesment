//
//  DashboardViewController.swift
//  interview-project
//
//  Created by Aritio modernland on 04/03/22.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var btnKrakatau: UIButton!
    
    @IBOutlet weak var btnGede: UIButton!
    
    @IBOutlet weak var btnMerapi: UIButton!
    
    @IBOutlet weak var btnKembali: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnKrakatau(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "krakatauViewController") as! krakatauViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
    
    @IBAction func btnGede(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "gedeViewController") as! gedeViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
    @IBAction func btnMerapi(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "merapiViewController") as! merapiViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
    @IBAction func btnKembali(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let secondVc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
        
        present(secondVc, animated: true, completion: nil)
    }
}
