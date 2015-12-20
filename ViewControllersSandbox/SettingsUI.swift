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

	func navigationBarButton() -> UIBarButtonItem {
		return UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: "showSettings:")
	}

	@objc func showSettings(sender: UIBarButtonItem?) {
		if let containerController = containerController,
			sender = sender
		{
			SettingsViewController.showSettingsViewController(inController: containerController, atBarButton: sender)
		}
	}
}

extension SettingsUI {
	static let keyName = "settingsUI"
}

extension UIViewController {
	/// Returns UIBarButton for displaying SettingsViewController
	func settingsButtonItem() -> UIBarButtonItem {
		let settingsUI: SettingsUI
		if let ui = objc_getAssociatedObject(self, SettingsUI.keyName) as? SettingsUI {
			settingsUI = ui
		} else {
			settingsUI = SettingsUI(container: self)
		}
		objc_setAssociatedObject(self, SettingsUI.keyName, settingsUI, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
		return settingsUI.navigationBarButton()
	}
}
