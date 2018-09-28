//
//  JustView.swift
//  ViewSample
//
//  Created by hideta on 2018/09/21.
//  Copyright © 2018 hideta. All rights reserved.
//

import UIKit

class JustView: UIViewController {
    
    var label: UILabel!
    var rect1: UIView!
    var rect2: UIView!
    var rect3: UIView!
    var rect4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UIView"
        
        self.view.backgroundColor = UIColor.white
        
        label = UILabel(frame: CGRect())
        label.text = "Label"
        label.textColor = UIColor.black
        label.sizeToFit()
        view.addSubview(label)
        
        rect1 = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        rect1.backgroundColor = UIColor.red
        view.addSubview(rect1)
        
        rect2 = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        rect2.backgroundColor = UIColor.green
        view.addSubview(rect2)
        
        rect3 = UIView(frame: CGRect(x: 0, y:0, width: 80, height: 80))
        rect3.backgroundColor = UIColor.blue
        view.addSubview(rect3)
        
        rect4 = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        rect4.backgroundColor = UIColor.yellow
        view.addSubview(rect4)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.center = view.center
        
        //rect1.frame.origin.x = 0
        //rect1.frame.origin.y = 0

        rect2.frame.origin.x = view.frame.width - rect2.bounds.width
        rect2.frame.origin.y = view.frame.height - rect2.bounds.height
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight = navigationController?.toolbar.frame.size.height
        rect3.frame.origin.x = view.frame.width - rect3.bounds.width
        rect3.frame.origin.y = statusBarHeight + navigationBarHeight!
        
        rect4.center = view.center  // over the label
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
