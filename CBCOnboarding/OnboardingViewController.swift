//
//  OnboardingViewController.swift
//  CBCOnboarding
//
//  Created by Viviane Chan on 2018-12-28.
//  Copyright © 2018 CBC. All rights reserved.
//

import UIKit

public class OnboardingViewController: UIViewController {
    
    public var pageIndex = 0
    public var viewControllers: [UIViewController]!
    public var exitStoryboardName: String!
    public var exitStoryboardIdentifier: String!
    
    @IBAction func handleNextButton(_ sender: Any) {
        for _ in pageIndex..<viewControllers.count {
            let nextViewController = viewControllers[pageIndex]
            scrollViewController.setController(to: nextViewController, animated: true)
            pageIndex += 1
        }
        let storyboard = UIStoryboard(name: exitStoryboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: exitStoryboardIdentifier)
        self.present(viewController, animated: true)
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

