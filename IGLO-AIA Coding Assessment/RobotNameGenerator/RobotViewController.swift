//
//  RobotViewController.swift
//  IGLO-AIA Coding Assessment
//
//  Created by Vebby Clarissa on 17/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class RobotViewController: UIViewController {
    
    var robots : [Robot] = []

    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTable), for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.refreshControl = self.refreshControl
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Robot Name Generator"
        view.backgroundColor = .white
        initView()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(robots.map({$0.name}), forKey: "robotsname")
    }
    
    func initView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRobot))
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func loadData() {
        guard let names : [String] = UserDefaults.standard.array(forKey: "robotsname") as? [String] else {return}
        for name in names {
            robots.append(Robot(name))
        }
        tableView.reloadData()
    }
    
    @objc func addRobot() {
        var newRobot = Robot()
        while (robots.map({$0.name}) .contains(newRobot.name)) {
            newRobot.rename()
        }
        robots.append(newRobot)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        cell?.textLabel?.text = newRobot.name
    }
    
    @objc func refreshTable() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension RobotViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = robots[indexPath.row].name
        return cell
    }
}
