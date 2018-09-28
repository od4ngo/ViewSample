//
//  CollectionView.swift
//  ViewSample
//
//  Created by hideta on 2018/09/22.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class CollectionView: UIViewController {
    
    var contents: CustomArea!
    var collectionView: UICollectionView!
    
    let dataList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"] // class let was NG
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CollectionView"
        
        self.view.backgroundColor = UIColor.white
        
        contents = CustomArea(frame: CGRect())
        contents.title = "Custom Area here"
        self.view.addSubview(contents)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 110, height: 110)
        
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "customCell")
        self.view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight = navigationController?.toolbar.frame.size.height

        contents.center.x = self.view.center.x
        contents.frame.origin.y = statusBarHeight + navigationBarHeight!
        //contents.frame.size.width = view.frame.size.width // using auto layout?
        
        let customAreaHeight = contents.frame.size.height
        
        collectionView.frame.origin.x = 0
        collectionView.frame.origin.y = statusBarHeight + navigationBarHeight! + customAreaHeight
        collectionView.frame.size.width = view.frame.width
        collectionView.frame.size.height = view.frame.height -
                                (statusBarHeight + navigationBarHeight! + customAreaHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension CollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionCell
        
        cell.image = UIImage(named: "kyoto")
        cell.title = "Item " + dataList[indexPath.row]
        
        /*
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //cell.backgroundColor = UIColor.yellow
        
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.frame.size.width = cell.contentView.frame.width
        imageView.frame.size.height = cell.contentView.frame.height - 24
        imageView.image = UIImage(named: "tokyo")
        cell.contentView.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 0, y: cell.contentView.frame.height - 24, width: cell.contentView.frame.width, height: 24))
        label.text = "Item " + dataList[indexPath.row]
        label.textAlignment = NSTextAlignment.center
        label.layoutMargins = UIEdgeInsets(top: 6, left: 2, bottom: 6, right: 2)
        label.backgroundColor = UIColor.cyan
        cell.contentView.addSubview(label)
        */
        
        return cell
    }

}

extension CollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}
