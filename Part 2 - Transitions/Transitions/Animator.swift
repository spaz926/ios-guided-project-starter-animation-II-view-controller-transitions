//
//  Animator.swift
//  Transitions
//
//  Created by Jeffrey Carpenter on 5/16/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

typealias LabelProvidingVC = LabelProviding & UIViewController

class Animator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? LabelProvidingVC,
        let toVC = transitionContext.viewController(forKey: .to) as? LabelProvidingVC,
        let toView = transitionContext.view(forKey: .to)
        else { return }
        
        // This is the view that holds the label we will animate from one position to the other
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0
        
        // Figure out where the label should start and where it should end up
        let fromLabel   = fromVC.label!
        let toLabel     = toVC.label!
        
        // Hide our REAL labels so they don't show up during the transition
        fromLabel.alpha = 0
        toLabel.alpha   = 0
        
        let transitionLabelInitialFrame = containerView.convert(fromLabel.bounds, from: fromLabel)
        
        // The transitioning label will be in exactly the same initial locatio nas the fromLabel
        let transitioningLabel = UILabel(frame: transitionLabelInitialFrame)
        transitioningLabel.textColor = .white
        transitioningLabel.font = fromLabel.font
        transitioningLabel.text = fromLabel.text
        containerView.addSubview(transitioningLabel)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration, animations: {
            let transitioningLabelEndFrame = containerView.convert(toLabel.bounds, from: toLabel)
            transitioningLabel.frame = transitioningLabelEndFrame
        }) { _ in
            toLabel.alpha = 1
            fromLabel.alpha = 1
            transitioningLabel.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
