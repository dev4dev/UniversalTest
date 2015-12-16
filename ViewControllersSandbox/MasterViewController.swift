//
//  MasterViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	lazy var settingsUI: SettingsUI = {
		return SettingsUI(container: self)
	}()

	weak var detailsViewController: DetailsViewController?

	override func viewDidLoad() {
		super.viewDidLoad()

		settingsUI.addNavigationBarButtonOnPhone()
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

		let row = 0
		tableView.selectRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), animated: false, scrollPosition: .Top)
		showDetailsControllerForNumber(row)
	}

	func showDetailsControllerForNumber(number: Int) {
		detailsViewController?.infoLabel.text = "Wow \(number)"
	}
}

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
