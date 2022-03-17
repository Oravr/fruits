//
//  Extensions.swift
//  Matrix
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation
import UIKit

extension UIView {
    func setupLoadingIndicator(for view: UIView) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return indicator
    }
    
        func circular(
            borderwidth: CGFloat = 2.0,
            bordercolor: CGColor = UIColor.lightGray.cgColor
        ) {
            self.layer.cornerRadius = (self.frame.size.height / 2.0)
            self.clipsToBounds = true
            self.layer.masksToBounds = true
            
            self.layer.borderColor = bordercolor
            self.layer.borderWidth = borderwidth
        }
}
