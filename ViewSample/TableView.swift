//
//  TableView.swift
//  ViewSample
//
//  Created by hideta on 2018/09/22.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class TableView: UIViewController {
    
    var contents: CustomArea!
    var tableView: UITableView!
    
    let tableTitle = "Table Title"
    let dataList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TableView"
        self.viewRespectsSystemMinimumLayoutMargins = false
        
        self.view.backgroundColor = UIColor.white
        
        contents = CustomArea(frame: CGRect())
        contents.title = "Custom Area here"
        self.view.addSubview(contents)
        
        tableView = UITableView(frame: CGRect())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: "customCell")
        tableView.tableFooterView = UIView(frame: CGRect())
        self.view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight = navigationController?.toolbar.frame.size.height
        
        contents.center.x = self.view.center.x
        contents.frame.origin.y = statusBarHeight + navigationBarHeight!
        
        let customAreaHeight = contents.bounds.size.height
        
        tableView.frame.origin.x = 0
        tableView.frame.origin.y = statusBarHeight + navigationBarHeight! + customAreaHeight
        tableView.frame.size.width = view.frame.width
        tableView.frame.size.height = view.frame.height -
                                (statusBarHeight + navigationBarHeight! + customAreaHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension TableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableCell
        
        cell.customImage = UIImage(named: "tokyo")
        cell.title = "Item " + dataList[indexPath.row]
        cell.subtitle = "Subtitle " + dataList[indexPath.row]
        
        return cell
    }
    
}

extension TableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}
