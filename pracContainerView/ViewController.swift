//
//  ViewController.swift
//  pracContainerView
//
//  Created by A-Chang Lin on 2018/7/9.
//  Copyright © 2018年 Sheng-Zhang Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    var selectedViewController: UIViewController!
    
    lazy var aViewController: aViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "A") as! aViewController
    }()
    
    lazy var bViewController: bViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "B") as! bViewController
    }()
    
    lazy var cViewController: cViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "C") as! cViewController
    }()
    
    lazy var dViewController: dViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "D") as! dViewController
    }()
    
    lazy var eViewController: eViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "E") as! eViewController
    }()
    
    @IBAction func controlButtonDidTap(_ sender: Any) {
        let button = sender as! UIButton
        if button.titleLabel?.text == "A" {
            changePage(to: aViewController)
        }
        if button.titleLabel?.text == "B" {
             changePage(to: bViewController)
        }
        if button.titleLabel?.text == "C" {
            changePage(to: cViewController)
        }
        if button.titleLabel?.text == "D" {
            changePage(to: dViewController)
        }
        if button.titleLabel?.text == "E" {
            changePage(to: eViewController)
        }
    }
    
    func changePage(to newViewController: UIViewController) {
        // 2. Remove previous viewController
        selectedViewController.willMove(toParentViewController: nil)
        selectedViewController.view.removeFromSuperview()
        selectedViewController.removeFromParentViewController()
        
        // 3. Add new viewController
        addChildViewController(newViewController)
        self.containerView.addSubview(newViewController.view)
        newViewController.view.frame = containerView.bounds
        newViewController.didMove(toParentViewController: self)
        
        // 4.
        self.selectedViewController = newViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        selectedViewController = aViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

