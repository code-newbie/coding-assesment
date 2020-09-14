//
//  ReceiptView.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

class ReceiptView: UIViewController, ReceiptPresenterToView {
    var presenter: ReceiptViewToPresenter?
    
    init() {
        super.init(nibName: "ReceiptView", bundle: Bundle(for: ReceiptView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
