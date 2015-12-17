//
//  RootViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class RootViewController: UISplitViewController {
	override func awakeFromNib() {
		super.awakeFromNib()
		preferredDisplayMode = .AllVisible
		maximumPrimaryColumnWidth = 300
		minimumPrimaryColumnWidth = 280
		preferredPrimaryColumnWidthFraction = 0.3

		delegate = self
	}

	func detailsVC() -> UIViewController? {
		if viewControllers.count > 1 {
			return viewControllers[1]
		} else {
			return nil
		}
	}

	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		if UIDevice.isPad() {
			return .All
		} else {
			return .Portrait
		}
	}

	override func shouldAutorotate() -> Bool {
		return UIDevice.isPad()
	}
}

extension RootViewController: UISplitViewControllerDelegate {

	func splitViewController(splitViewController: UISplitViewController, showDetailViewController vc: UIViewController, sender: AnyObject?) -> Bool {
		if let detailsVC = detailsVC() as? UINavigationController {
			detailsVC.setViewControllers([vc], animated: false)
			return true
		} else {
			return false
		}
	}
	
}
