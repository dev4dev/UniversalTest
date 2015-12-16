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

	override func viewDidLoad() {
		super.viewDidLoad()

		settingsUI.addNavigationBarButtonOnPad()
	}
}
