//
//  RobotViewController.swift
//  IGLO-AIA Coding Assessment
//
//  Created by Vebby Clarissa on 17/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class RobotViewController: UIViewController {

    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Robot Name Generator"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        
    }
}

extension RobotViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
