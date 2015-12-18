//
//  DetailsViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var infoLabel: UILabel!

	// MARK: - Data
	var value: String?

	// MARK: - UI Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		updateView()
	}

	func setupView() {
		if UIDevice.isPad() {
			navigationItem.rightBarButtonItem = settingsButtonItem()
		}

		switch self.view.viewOrientation {
		case .Portrait:
			print("Setup portrait")
		case .Landscape:
			print("Setup landscape")
		}
	}

	func updateView() {
		infoLabel.text = value
	}

	// MARK: - Transitions
	override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
		print(newCollection.horizontalSizeClass.rawValue)
	}

	override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
		print("From \(self.view.viewOrientation) to \(UIView.viewOrientationForSize(size))")
	}
}
