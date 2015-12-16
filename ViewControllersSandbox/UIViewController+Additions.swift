//
//  UIViewController+Additions.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

extension UIViewController {
	func embedInNavigationController() -> UINavigationController {
		return UINavigationController(rootViewController: self)
	}
}
