//
//  RootViewController.swift
//  IGLO-AIA Coding Assessment
//
//  Created by Vebby Clarissa on 16/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    lazy var btnRobot : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        btn.setTitle("Robot Name generator", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.lineBreakMode = .byWordWrapping
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = .systemFont(ofSize: 24, weight: .light)
        btn.layer.cornerRadius = 20
        btn.addTarget(nil, action: #selector(btnRobotPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnSoalImage : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        btn.setTitle("Image Galery", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.lineBreakMode = .byWordWrapping
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = .systemFont(ofSize: 24, weight: .light)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.addArrangedSubview(btnRobot)
        stack.addArrangedSubview(btnSoalImage)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Menu"
        view.backgroundColor = .white
        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.5, constant: -10),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func btnRobotPressed () {
        self.navigationController?.pushViewController(RobotViewController(), animated: true)
    }
}
