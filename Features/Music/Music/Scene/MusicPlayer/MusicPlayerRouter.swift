// 
//  MusicPlayerRouter.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

class MusicPlayerRouter: MusicPlayerPresenterToRouter {
    
    static func createMusicPlayerModule() -> UIViewController {
        let view: UIViewController & MusicPlayerPresenterToView = MusicPlayerView()
        let presenter: MusicPlayerViewToPresenter & MusicPlayerInteractorToPresenter = MusicPlayerPresenter()
        let interactor: MusicPlayerPresenterToInteractor = MusicPlayerInteractor()
        let router: MusicPlayerPresenterToRouter = MusicPlayerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
