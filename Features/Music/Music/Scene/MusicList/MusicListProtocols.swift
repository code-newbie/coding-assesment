// 
//  MusicListProtocols.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

//MARK: View -
protocol MusicListPresenterToView: class {
    var presenter: MusicListViewToPresenter? { get set }
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
    func setupView()
    func navigationBar()
}

//MARK: Interactor -
protocol MusicListPresenterToInteractor: class {
    var presenter: MusicListInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
}


//MARK: Router -
protocol MusicListPresenterToRouter: class {
    func navigateToPlayer(_ from: MusicListPresenterToView, dataModel: [Song]?, indexPath: IndexPath)
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol MusicListViewToPresenter: class {
    var view: MusicListPresenterToView? {get set}
    var interactor: MusicListPresenterToInteractor? {get set}
    var router: MusicListPresenterToRouter? {get set}
    var musicModel : [Song] {get set}
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
    func viewDidload()
    func didSelect(dataModel: [Song]?, indexPath: IndexPath)
}

protocol MusicListInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}
