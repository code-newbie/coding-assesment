//
//  UIButton.swift
//  Common
//
//  Created by ILHAM on 12/09/20.
//

import UIKit
import CommonUIKit

public class Commonbutton: UIButton {
    // MARK: override methods
    // to observe re-layout caused by Auto Layout

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func setLayout() {
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = CommonUIConstant.one
        setTitleColor(.blue, for: .normal)
        layer.cornerRadius = CommonUIConstant.fifteen
    }
    
    required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    
}
