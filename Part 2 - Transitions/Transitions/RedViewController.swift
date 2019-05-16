//
//  RedViewController.swift
//  Transitions
//
//  Created by Spencer Curtis on 1/31/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

class RedViewController: LabelProvidingVC, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    let animator = Animator()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
    }
    
    @IBAction func dismiss(_ sender: Any) {
        transitioningDelegate = self
        dismiss(animated: true, completion: nil)
    }
}
