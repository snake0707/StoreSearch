//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by snake on 15/8/4.
//  Copyright (c) 2015年 snakeLib. All rights reserved.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    lazy var dimmingView = GradientView(frame: CGRect.zeroRect)
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView.bounds
        
        containerView.insertSubview(dimmingView, atIndex: 0)
        
        dimmingView.alpha = 0.0
        
        if let transitionCoordinator = presentedViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({ _ in self.dimmingView.alpha = 1}, completion: nil)
        }
    }
    
    override func shouldRemovePresentersView() -> Bool {
        return false
    }
    
    override func dismissalTransitionWillBegin() {
        if let transitionCoordinator = presentedViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({ _ in self.dimmingView.alpha = 0}, completion: nil)
        }
    }
}
