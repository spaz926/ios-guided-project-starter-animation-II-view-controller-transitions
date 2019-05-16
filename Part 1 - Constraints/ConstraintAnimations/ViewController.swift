//
//  ViewController.swift
//  ConstraintAnimations
//
//  Created by Spencer Curtis on 2/7/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var redViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var redViewAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var redViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var redViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func animateSquare(_ sender: Any) {
        
    }
    
    @IBAction func changeConstraints(_ sender: Any) {
        
    }
}

