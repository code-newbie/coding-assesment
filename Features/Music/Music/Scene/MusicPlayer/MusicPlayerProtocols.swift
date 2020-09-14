// 
//  MusicPlayerProtocols.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

//MARK: View -
protocol MusicPlayerPresenterToView: class {
    var presenter: MusicPlayerViewToPresenter? { get set }
    var position: Int {get set}
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
    func configure()
}

//MARK: Interactor -
protocol MusicPlayerPresenterToInteractor: class {
    var presenter: MusicPlayerInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
}


//MARK: Router -
protocol MusicPlayerPresenterToRouter: class {
    static func createMusicPlayerModule() -> UIViewController
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol MusicPlayerViewToPresenter: class {
    var view: MusicPlayerPresenterToView? {get set}
    var interactor: MusicPlayerPresenterToInteractor? {get set}
    var router: MusicPlayerPresenterToRouter? {get set}
    var dataModel: [Song]? {get set}
    var data: Song? {get set}
    var indexPath: IndexPath? {get set}
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
    func viewDidload()
}

protocol MusicPlayerInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}
