//
//  CustomCollectionCell.swift
//  ViewSample
//
//  Created by hideta on 2018/09/24.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    // MARK: Property
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = UIColor.green
        //imageView.image = UIImage(named: "tokyo")
        imageView.translatesAutoresizingMaskIntoConstraints = false // 後で制約を付加するときは false
        return imageView
    }()
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
            //self.setNeedsLayout()
        }
    }
    
    let label: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor.yellow
        //label.text = "Item "
        label.textAlignment = NSTextAlignment.center
        label.layoutMargins = UIEdgeInsets(top: 6, left: 2, bottom: 6, right: 2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    var title: String? {
        get {
            return label.text
        }
        set(title) {
            label.text = title
            //self.setNeedsLayout()
        }
    }
    
    // MARK: Initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    // MARK: Method
    
    private func commonInit() {
        //backgroundColor = UIColor.cyan
        
        // add subviews
        addSubview(imageView)
        addSubview(label)
        
        // set constraints
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24).isActive = true
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
