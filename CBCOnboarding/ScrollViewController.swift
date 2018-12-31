//
//  ScrollViewController.swift
//  CBCOnboarding
//
//  Created by Viviane Chan on 2018-12-28.
//  Copyright © 2018 CBC. All rights reserved.
//

import UIKit

public class ScrollViewController: UIViewController {
    
    public var scrollView: UIScrollView {
        return view as! UIScrollView
    }
    
    public var pageSize: CGSize {
        return scrollView.frame.size
    }
    
    public var viewControllers: [UIViewController]!
    
    override public func loadView() {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isPagingEnabled = true
        view = scrollView
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for (index, controller) in viewControllers.enumerated() {
            addChild(controller)
            controller.view.frame = frame(for: index)
            scrollView.addSubview(controller.view)
            controller.didMove(toParent: self)
        }
        
        scrollView.contentSize = CGSize(width: pageSize.width * CGFloat(viewControllers.count), height: pageSize.height)
        
        if let controller = viewControllers.first {
            setController(to: controller, animated: false)
        }
    }
}

extension ScrollViewController {
    func frame(for index: Int) -> CGRect {
        return CGRect(x: CGFloat(index) * pageSize.width, y: 0, width: pageSize.width, height: pageSize.height)
    }
    
    func indexFor(controller: UIViewController?) -> Int? {
        return viewControllers.index(where: {$0 == controller })
    }
    
    
    public func setController(to controller: UIViewController, animated: Bool) {
        guard let index = indexFor(controller: controller) else { return }
        let contentOffset = CGPoint(x: pageSize.width * CGFloat(index), y: 0)
        
        if animated {
            UIView.animate(withDuration: 0.2, delay: 0, options: [UIView.AnimationOptions.curveEaseOut], animations: {
                self.scrollView.setContentOffset(contentOffset, animated: false)
            })
        } else {
            scrollView.setContentOffset(contentOffset, animated: animated)
        }
    }
}
