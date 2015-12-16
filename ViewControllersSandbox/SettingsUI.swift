//
//  SettingsUI.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class SettingsUI {

	weak var containerController: UIViewController?

	init(container: UIViewController) {
		containerController = container
	}

	func addNavigationBarButtonOnPhone() {
		if UIDevice.isPhone() {
			addNavigationBarButton()
		}
	}

	func addNavigationBarButtonOnPad() {
		if UIDevice.isPad() {
			addNavigationBarButton()
		}
	}

	func addNavigationBarButton() {
		containerController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: "showSettings:")
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
