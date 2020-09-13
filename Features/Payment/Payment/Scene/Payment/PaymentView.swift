//
//  PaymentView.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Common
import CommonUIKit
import Domains

class PaymentView: UIViewController, PaymentPresenterToView {
    var presenter: PaymentViewToPresenter?
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNominalLabel: UILabel!
    @IBOutlet weak var productPriceErrorLabel: UILabel!
    
    @IBOutlet weak var verticalStackView: UIView!
    @IBOutlet weak var paymentButton: Commonbutton!
    var allButtons = [Commonbutton]()
    let bundle = Bundle(for: PaymentView.self)
    let className: String = String(describing: PaymentView.self)
    
    init() {
        super.init(nibName: className, bundle: Bundle(for: PaymentView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        
    }
    
    func navigationBar() {
        navigationItem.title = Constants.titleNavigationBar
    }
    
    func setArrayButton(listButton: [ButtonModel]) {
        for (index,element) in listButton.enumerated() {
            let button  = Commonbutton()
            button.setTitle("\(element.nominal)", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.tag = index
            button.titleLabel?.font = CommonUIFont.shared.getBodyFont(.note)
            allButtons.append(button)
        }
    }
    
    func setStackView() {
        let stackView = UIStackView(arrangedSubviews: allButtons)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = CommonUIConstant.five
        stackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: verticalStackView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor).isActive = true
    }
    
    func deselectAllButtons() {
        allButtons.forEach {
            $0.isSelected = false
            $0.backgroundColor = UIColor.white
            $0.setTitleColor(.blue, for: .normal)
        }
    }
    
    @objc
    func buttonAction(sender: UIButton!) {
        deselectAllButtons()
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = UIColor.blue
        sender.setTitleColor(.white, for: .normal)
        guard let currentcy = sender.titleLabel?.text else { return }
        let price: Int = Int(currentcy) ?? .zero
        
        if price<presenter?.dataModel?.price ?? .zero {
            productPriceErrorLabel.isHidden = false
            paymentButton.backgroundColor = UIColor.white
            paymentButton.setTitleColor(.blue, for: .normal)
            paymentButton.isUserInteractionEnabled = false
        } else {
            productPriceErrorLabel.isHidden = true
            paymentButton.backgroundColor = UIColor.blue
            paymentButton.setTitleColor(.white, for: .normal)
            paymentButton.isUserInteractionEnabled = true
        }
        
        productNominalLabel.text = Constants.currentcy + currentcy.convertCurrentcy()
        
    }
    
    func setInformation(productImage:String?, productName: String?, price:Int?) {
        guard let productImage = productImage, let productName = productName, let price = price else { return }
        productImageView.image = UIImage(named: productImage, in: bundle, compatibleWith: nil)
        productNameLabel.text = productName
        productPriceLabel.text =  Constants.currentcy +  "\(price)".convertCurrentcy()
    }
    
    @IBAction func actionSubmit() {
        if presenter?.dataModel?.stock == 0 {
            let alert = UIAlertController(title: "Alert", message: "Stock Habis", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.gray
            loadingIndicator.startAnimating();
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                alert.message = "Success"
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                loadingIndicator.stopAnimating()
                loadingIndicator.isHidden = true
                alert.dismiss(animated: true, completion: nil)
            }
            
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
        }
    }
    
}
