//
//  VendingMachineConfigurator.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

public class VendingMachineConfigurator {
    public static var shared = VendingMachineConfigurator()
    public weak var delegate:  VendingMachineWireframe?
    
    public func createVendingModule() -> UIViewController {
           let view: UIViewController & VendingPresenterToView = VendingView()
           let presenter: VendingViewToPresenter & VendingInteractorToPresenter = VendingPresenter()
           let interactor: VendingPresenterToInteractor = VendingInteractor()
           let router: VendingPresenterToRouter = VendingRouter()
           
           view.presenter = presenter
           presenter.view = view
           presenter.router = router
           presenter.interactor = interactor
           interactor.presenter = presenter
           
           return view
       }
}
