//
//  CBCOnboarding.swift
//  cbc-onboarding
//
//  Created by Viviane Chan on 2018-12-29.
//  Copyright © 2018 CBC. All rights reserved.
//

import UIKit

public class CBCOnboarding {
    
    public var identifiers: [String]!
    public var exitStoryboardName: String!
    public var exitStoryboardIdentifier: String!

    public var viewControllers: [UIViewController]?
    public var onboardingViewController: OnboardingViewController!
    public var bundle: Bundle!
    public var storyboard: UIStoryboard!
    
    public init (identifiers: [String], exitStoryboardName: String, exitStoryboardIdentifier: String) {
        self.identifiers = identifiers
        self.exitStoryboardName = exitStoryboardName
        self.exitStoryboardIdentifier = exitStoryboardIdentifier

        loadOnboardingViewControllers()
    }
    
    public func loadOnboardingViewControllers() {
        if identifiers.count > 0 {
            for identifier in identifiers {
                let viewController: UIViewController! = {
                    return self.storyboard?.instantiateViewController(withIdentifier: identifier)
                }()
                viewControllers?.append(viewController)
            }
            initializeOnboardingViewController()
        } else {
            print("Onboarding has no view controllers to show")
        }
    }
    
    public func initializeOnboardingViewController() {
        guard let bundlePath = Bundle.init(for: CBCOnboarding.self).path(forResource: "CBCOnboarding", ofType: "bundle") else {
            fatalError("CBCOnboarding Bundle was not found")
        }
        self.bundle = Bundle(path: bundlePath)
        self.storyboard = UIStoryboard(name: "Onboarding", bundle: self.bundle)
        self.onboardingViewController = (storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController)
        self.onboardingViewController.viewControllers = viewControllers
        self.onboardingViewController.exitStoryboardName = exitStoryboardName
        self.onboardingViewController.exitStoryboardIdentifier = exitStoryboardIdentifier
    }
}


