//
//  ContainerViewController.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 1/13/16.
//  Copyright © 2016 Alex Antonyuk. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

	@IBOutlet weak var bannerContainerHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func hide(sender: UIButton?) {
		view.updateConstraintsIfNeeded()
		bannerContainerHeightConstraint.constant = 0
		UIView.animateWithDuration(0.25) { [unowned self] in
			self.view.layoutIfNeeded()
		}
	}
}
