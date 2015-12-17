//
//  UIView+Additions.swift
//  ViewControllersSandbox
//
//  Created by Alex Antonyuk on 12/17/15.
//  Copyright © 2015 Alex Antonyuk. All rights reserved.
//

import UIKit

public enum ViewOrientation {
	case Portrait
	case Landscape
}

extension UIView {
	public class func viewOrientationForSize(size:CGSize) -> ViewOrientation {
		if UIDevice.isPhone() {
			return (size.width > size.height) ? .Landscape : .Portrait
		} else {
			return size.height == 1024.0 ? .Portrait : .Landscape
		}
	}

	public var viewOrientation: ViewOrientation {
		return UIView.viewOrientationForSize(self.bounds.size)
	}

	public func isViewOrientationPortrait() -> Bool {
		return self.viewOrientation == .Portrait
	}

	public func isViewOrientationLandscape() -> Bool {
		return self.viewOrientation == .Landscape
	}
}
