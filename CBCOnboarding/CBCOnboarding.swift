//
//  CBCOnboarding.swift
//  cbc-onboarding
//
//  Created by Viviane Chan on 2018-12-29.
//  Copyright © 2018 CBC. All rights reserved.
//

import UIKit

public class CBCOnboarding {
    
    public var onboardingViewControllers: [UIViewController]!
    public var onboardingViewController: CBCOnboardingViewController!
    public var exitStoryboardName: String = "Main"
    public var exitStoryboardIdentifier: String = "MainTabBarController"
    
    public init (onboardingViewControllers: [UIViewController], exitStoryboardName: String, exitStoryboardIdentifier: String){
        self.onboardingViewControllers = onboardingViewControllers
        self.exitStoryboardName = exitStoryboardName
        self.exitStoryboardIdentifier = exitStoryboardIdentifier
    }
    
    public func loadOnboardingViewControllers() -> CBCOnboardingViewController? {
        initializeOnboardingViewController()
        return self.onboardingViewController
    }
    
    public func initializeOnboardingViewController() {
        guard let bundlePath = Bundle.init(for: CBCOnboarding.self).path(forResource: "CBCOnboarding", ofType: "bundle") else {
            fatalError("CBCOnboarding Bundle was not found")
        }
        let bundle = Bundle(path: bundlePath)
        let storyboard = UIStoryboard(name: "CBCOnboarding", bundle: bundle)
        self.onboardingViewController = (storyboard.instantiateViewController(withIdentifier: "CBCOnboardingViewController") as! CBCOnboardingViewController)
        self.onboardingViewController.viewControllers = onboardingViewControllers
    }
}


