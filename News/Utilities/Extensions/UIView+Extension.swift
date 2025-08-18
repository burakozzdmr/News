//
//  UIView+Extension.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
