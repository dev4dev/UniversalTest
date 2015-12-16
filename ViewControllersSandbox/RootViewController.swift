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

		masterVC()?.detailsViewController = detailsVC()
	}
	
	func masterVC() -> MasterViewController? {
		guard viewControllers.count > 0 else {
			return nil
		}
		guard let nav = viewControllers.first as? UINavigationController else {
			return viewControllers.first as? MasterViewController
		}

		return nav.viewControllers.first as? MasterViewController
	}

	func detailsVC() -> DetailsViewController? {
		if viewControllers.count > 1 {
			return viewControllers[1] as? DetailsViewController
		} else {
			return nil
		}
	}
}
