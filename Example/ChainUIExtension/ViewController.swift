//
//  ViewController.swift
//  ChainUIExtension
//
//  Created by xudongzhang99@gmail.com on 11/21/2019.
//  Copyright (c) 2019 xudongzhang99@gmail.com. All rights reserved.
//

import UIKit
import ChainUIExtension
class ViewController: UIViewController {
    let label1 = UILabel().cui.font(1).color(0x123456).text("1111").backgroundColor(0x1111).end
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView().cui.addGesture { (_: UITapGestureRecognizer) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

