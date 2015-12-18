//
//  SettingsUI.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

extension UIViewController {
	/// Returns UIBarButton for displaying SettingsViewController
	func settingsButtonItem() -> UIBarButtonItem {
		let settingsUI: SettingsUI
		if let ui = objc_getAssociatedObject(self, "settingsUI") as? SettingsUI {
			settingsUI = ui
		} else {
			settingsUI = SettingsUI(container: self)
		}
		objc_setAssociatedObject(self, "settingsUI", settingsUI, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
		return settingsUI.navigationBarButton()
	}
}

class SettingsUI {

	weak var containerController: UIViewController?

	init(container: UIViewController) {
		containerController = container
	}

	func navigationBarButton() -> UIBarButtonItem {
		return UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: "showSettings:")
	}

	@objc func showSettings(sender: UIBarButtonItem?) {
		if let vc = containerController?.storyboard?.instantiateViewControllerWithIdentifier("SettingsVC") as? SettingsViewController {
			let nav = vc.embedInNavigationController()
			nav.modalPresentationStyle = .Popover
			containerController?.presentViewController(nav, animated: true, completion: nil)

			if let presentationController = nav.popoverPresentationController {
				presentationController.permittedArrowDirections = [.Any]
				presentationController.barButtonItem = sender
			}
		}
	}
}
