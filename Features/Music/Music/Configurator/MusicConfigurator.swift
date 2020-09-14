//
//  MusicConfigurator.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

public class MusicConfigurator {
    public static var shared = MusicConfigurator()
    public weak var delegate:  MusicWireframe?
    
    public func createMusicListModule() -> UIViewController {
        let view: UIViewController & MusicListPresenterToView = MusicListView()
        let presenter: MusicListViewToPresenter & MusicListInteractorToPresenter = MusicListPresenter()
        let interactor: MusicListPresenterToInteractor = MusicListInteractor()
        let router: MusicListPresenterToRouter = MusicListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    public func createMusicPlayerModule(dataModel: [Song]?, indexPath: IndexPath) -> UIViewController {
        let view: UIViewController & MusicPlayerPresenterToView = MusicPlayerView()
        let presenter: MusicPlayerViewToPresenter & MusicPlayerInteractorToPresenter = MusicPlayerPresenter()
        let interactor: MusicPlayerPresenterToInteractor = MusicPlayerInteractor()
        let router: MusicPlayerPresenterToRouter = MusicPlayerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.dataModel = dataModel
        presenter.data = dataModel![indexPath.row]
        presenter.indexPath = indexPath
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
