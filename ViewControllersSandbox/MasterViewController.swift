//
//  MasterViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!

	// MARK: - System
	lazy var settingsUI: SettingsUI = {
		return SettingsUI(container: self)
	}()

	// MARK: - UI Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		if UIDevice.isPhone() {
			navigationItem.rightBarButtonItem = settingsButtonItem()
		}
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

		if UIDevice.isPad() {
			let row = 0
			tableView.selectRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), animated: false, scrollPosition: .Top)
			showDetailsControllerForNumber(row)
		}
	}

	func showDetailsControllerForNumber(number: Int) {
		if let detailsVC = storyboard?.instantiateViewControllerWithIdentifier("DetailsVC") as? DetailsViewController {
			detailsVC.value = "Wow \(number)"
			showDetailViewController(detailsVC, sender: self)
		}
	}
}

// MARK: - TableView DD
extension MasterViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
	}

	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		cell.textLabel?.text = "\(indexPath.row)"
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		showDetailsControllerForNumber(indexPath.row)
	}
}
