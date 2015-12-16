//
//  UIDevice+Additions.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/16/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

extension UIDevice {
	static func isPhone() -> Bool {
		return UIDevice.currentDevice().userInterfaceIdiom == .Phone
	}

	static func isPad() -> Bool {
		return UIDevice.currentDevice().userInterfaceIdiom == .Pad
	}
}
