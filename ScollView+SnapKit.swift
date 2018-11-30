//
//  ViewController.swift
//  TrainScrollView+SnapKit
//
//  Created by Ericji on 2018/11/30.
//  Copyright © 2018 Ericji. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.backgroundColor = UIColor.yellow
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        let testView1 = UIView()
        testView1.backgroundColor = UIColor.red
        contentView.addSubview(testView1)
        testView1.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(500)
        }
        
        let testView2 = UIView()
        testView2.backgroundColor = UIColor.green
        contentView.addSubview(testView2)
        testView2.snp.makeConstraints { (make) in
            make.top.equalTo(testView1.snp.bottom)
            make.left.right.equalTo(testView1)
            make.height.equalTo(300)
            make.bottom.equalTo(contentView) // this is important, last component's bottom will decide contentsize
        }


    }


}

