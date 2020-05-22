//
//  ViewController.swift
//  AIA
//
//  Created by keenOI on 23/05/20.
//  Copyright © 2020 keen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let test1Button = UIButton(type: .system)
    let test2Button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}

extension ViewController {
    fileprivate func bindData() {
        bindUI()
        setAnchor()
    }
}

extension ViewController {
    fileprivate func bindUI() {
        view.backgroundColor = .white
        navigationItem.title = "AIA"

        test1Button.setTitle("Test 1", for: .normal)
        test1Button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        test1Button.tintColor = .white
        test1Button.layer.cornerRadius = 10
        test1Button.addTarget(self, action: #selector(handleTest1), for: .touchUpInside)
        
        test2Button.setTitle("Test 2", for: .normal)
        test2Button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        test2Button.tintColor = .white
        test2Button.layer.cornerRadius = 10
        test2Button.addTarget(self, action: #selector(handleTest2), for: .touchUpInside)
    }
    
    fileprivate func setAnchor() {
        view.addSubview(test1Button)
        view.addSubview(test2Button)
        
        test1Button.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: .zero, height: 40)
        
        test2Button.setAnchor(top: test1Button.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: .zero, height: 40)
    }
}

extension ViewController {
    @objc func handleTest1() {
        let listViewController = ListViewController()
        self.navigationController?.pushViewController(listViewController, animated: true)
    }
    
    @objc func handleTest2() {
        let randomNameViewController = RandomNameViewController()
        self.navigationController?.pushViewController(randomNameViewController, animated: true)
    }
}
