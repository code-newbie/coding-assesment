//
//  MusicPlayerPresenter.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation
import Domains

class MusicPlayerPresenter: MusicPlayerViewToPresenter {
    weak var view: MusicPlayerPresenterToView?
    var interactor: MusicPlayerPresenterToInteractor?
    var router: MusicPlayerPresenterToRouter?
    var dataModel: [Song]?
    var data: Song?
    var indexPath: IndexPath?
    
    func viewDidload() {
        guard let index = indexPath?.row else {return}
        view?.position = index
        view?.configure()
    }
    
}

extension MusicPlayerPresenter: MusicPlayerInteractorToPresenter {
    
}
