//
//  CBCOnboardingViewController.swift
//  CBCOnboarding
//
//  Created by Viviane Chan on 2018-12-28.
//  Copyright © 2018 CBC. All rights reserved.
//

import UIKit

public class CBCOnboardingViewController: UIViewController {
    
    public var pageIndex = 0
    public var viewControllers: [UIViewController]!
    private var exitStoryboardName: String = "Main"
    private var exitStoryboardIdentifier: String = "MainTabBarController"
    
    @IBAction func handleNextButton(_ sender: Any) {
        if pageIndex<viewControllers.count-1 {
            pageIndex += 1
            let nextViewController = viewControllers[pageIndex]
            scrollViewController.setController(to: nextViewController, animated: true)
        } else {
            let storyboard = UIStoryboard(name: exitStoryboardName, bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: exitStoryboardIdentifier)
            self.present(viewController, animated: true)
        }
    }
    
    @IBOutlet weak var navigationView: NavigationView!
    var scrollViewController: ScrollViewController!
    
    // MARK: - Navigation
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ScrollViewController {
            scrollViewController = controller
            scrollViewController.viewControllers = viewControllers
        }
    }
}

