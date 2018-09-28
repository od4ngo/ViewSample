//
//  RootViewController.swift
//  ViewSample
//
//  Created by hideta on 2018/09/21.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    let dataList = ["UIView", "UITableView", "UICollectionView"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ViewSample"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = dataList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController: UIViewController!
        
        switch indexPath.row {
        case 0:     viewController = JustView()
        case 1:     viewController = TableView()
        case 2:     viewController = CollectionView()
        default:    viewController = JustView()
        }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
