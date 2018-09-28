//
//  CustomArea.swift
//  ViewSample
//
//  Created by hideta on 2018/09/23.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class CustomArea: UIView {
    
    // MARK: Property
    
    lazy var titleLabel: UILabel = self.createLabel()
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set(title) {
            titleLabel.text = title
            self.setNeedsLayout()      // set flag if self need to reload frame
        }
     }
    
    // MARK: Initializer
    
    required init?(coder aDecoder: NSCoder) {   // to init from IB, called first
        fatalError("init(coder:) has not been implemented")
    }
    
    required override init(frame: CGRect) {     // to init from code
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    // MARK: Method
    
    private func commonInit() {
        
        self.bounds.size.height = 80
        self.backgroundColor = UIColor.cyan
        
        // add subview
        self.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {   // called after frame is changed
        super.layoutSubviews()
        
        self.layoutLabel()
    }
    
    private func createLabel() -> UILabel {
        
        let label = UILabel(frame: CGRect())
        label.textColor = UIColor.black
        
        return label
    }
    
    private func layoutLabel() {
        
        titleLabel.sizeToFit()

        // set coordinates
        titleLabel.center.x = self.frame.size.width/2
        titleLabel.center.y = self.frame.size.height/2
    }
    
}
