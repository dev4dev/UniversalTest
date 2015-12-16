//
//  DetailsViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

	@IBOutlet weak var infoLabel: UILabel!
	lazy var settingsUI: SettingsUI = {
		return SettingsUI(container: self)
	}()

	var value: String?

	override func viewDidLoad() {
		super.viewDidLoad()

		settingsUI.addNavigationBarButtonOnPad()
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		updateView()
	}

	func updateView() {
		infoLabel.text = value
	}
}
