//
//  CustomTableCell.swift
//  ViewSample
//
//  Created by hideta on 2018/09/24.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    // MARK: Property
    
    var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.frame.size = CGSize(width: 100, height: 80)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var customImage: UIImage? {
        get {
            return customImageView.image
        }
        set(image) {
            customImageView.image = image
        }
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.frame.size.height = 45
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.blue
        label.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set(title) {
            titleLabel.text = title
        }
    }
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.frame.size.height = 35
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subtitle: String? {
        get {
            return subtitleLabel.text
        }
        set(title) {
            subtitleLabel.text = title
        }
    }
    
    // MARK: Initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    // MARK: Method
    
    private func commonInit() {
        
        // add subviews
        contentView.addSubview(customImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        // set constraints
        customImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        customImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        customImageView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 45).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 20).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

}
