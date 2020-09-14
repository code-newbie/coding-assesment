//
//  UIView.swift
//  Common
//
//  Created by Ilhammalik on 27/05/20.
//  Copyright © 2020 Ilhammalik. All rights reserved.
//

import UIKit

// MARK: - Add Shadow
public extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowOffset  = offset
        layer.shadowColor   = color.cgColor
        layer.shadowRadius  = radius
        layer.shadowOpacity = opacity
        layer.shadowPath    = UIBezierPath.init(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
        
        let backgroundCGColor   = self.backgroundColor?.cgColor
        self.backgroundColor    = nil
        layer.backgroundColor   =  backgroundCGColor
    }
}
