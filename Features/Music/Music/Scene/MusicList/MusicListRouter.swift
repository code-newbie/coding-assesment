// 
//  MusicListRouter.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

class MusicListRouter: MusicListPresenterToRouter {
    func navigateToPlayer(_ from: MusicListPresenterToView, dataModel: [Song]?, indexPath: IndexPath) {
         guard let from = from as? UIViewController else {return}
        MusicConfigurator.shared.delegate?.fromMusicScreenToPlayer(from, dataModel: dataModel,  indexPath: indexPath)
    }
}
