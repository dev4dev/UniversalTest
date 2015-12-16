//
//  SettingsViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "onDone")
	}

	func onDone() {
		presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
	}

}
