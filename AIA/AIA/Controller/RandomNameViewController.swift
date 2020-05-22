//
//  RandomNameViewController.swift
//  AIA
//
//  Created by keenOI on 23/05/20.
//  Copyright © 2020 keen. All rights reserved.
//

import UIKit

class RandomNameViewController: UITableViewController {

    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}

extension RandomNameViewController {
    fileprivate func bindData() {
        setNav()
        setTableView()
    }
}

extension RandomNameViewController {
    fileprivate func setNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Generate", style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleInsert))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    fileprivate func setTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
}

extension RandomNameViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
}

extension RandomNameViewController {
    @objc func handleInsert() {
        items.append(randomString(2)+randomInt(3))
        let insertIndexPath = IndexPath(row: items.count - 1, section: 0)
        tableView.insertRows(at: [insertIndexPath], with: .automatic)
    }
    
    func randomString(_ n: Int) -> String {
        let charactersString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var string = ""

        for _ in 0..<n {
            let r = Int(arc4random_uniform(UInt32(charactersString.count)))
            string += String(charactersString[charactersString.index(charactersString.startIndex, offsetBy: r)])
        }
        return string
    }
    
    func randomInt(_ n: Int) -> String {
        let charactersString = "1234567890"
        var string = ""

        for _ in 0..<n {
            let r = Int(arc4random_uniform(UInt32(charactersString.count)))
            string += String(charactersString[charactersString.index(charactersString.startIndex, offsetBy: r)])
        }
        return string
    }
}
