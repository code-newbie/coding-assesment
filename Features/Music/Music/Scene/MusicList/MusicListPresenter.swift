//
//  MusicListPresenter.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation
import Domains
import UIKit

class MusicListPresenter: MusicListViewToPresenter {
    weak var view: MusicListPresenterToView?
    var interactor: MusicListPresenterToInteractor?
    var router: MusicListPresenterToRouter?

    var musicModel : [Song] = [
        Song(name: "100 Degrees",
             albumName: "123 Other",
             artistName: "Rich Brian",
             imageName: "cover1",
             trackName: link+richbrian),
        Song(name: "A Whole New World (End Title) - From Aladdin ",
             albumName: "Havana album",
             artistName: "ZAYN Malik",
             imageName: "cover2",
             trackName: link+zayn),
        Song(name: "Adu Rayu",
             albumName: "123 Something",
             artistName: "Yovie Widianto",
             imageName: "cover3",
             trackName: link+yovie),
        Song(name: "Amin Paling Serius",
             albumName: "123 Other",
             artistName: "Sal Priadi",
             imageName: "cover4",
             trackName: link+priadi),
        Song(name: "Bangun Cinta",
             albumName: "Havana album",
             artistName: "3 Composers",
             imageName: "cover5",
             trackName: link+composer),
        Song(name: "Beautiful People",
             albumName: "123 Something",
             artistName: "(feat Khalid) - Ed Sheeran",
             imageName: "cover6",
             trackName: link+khalid),
        Song(name: "Boy With Luv",
             albumName: "123 Other",
             artistName: "(feat Halsey) - BTS",
             imageName: "cover7",
             trackName: link+bts),
        Song(name: "boyfriend (with Social House)",
             albumName: "Havana album",
             artistName: "Ariana Grande",
             imageName: "cover8",
             trackName: link+richbrian),
        Song(name: "Cinta Karena Cinta",
             albumName: "123 Something",
             artistName: "Judika",
             imageName: "cover9",
             trackName: link+judika),
        Song(name: "Cinta Luar Biasa",
             albumName: "123 Other",
             artistName: "Andmesh",
             imageName: "cover10",
             trackName: link+andmesh),
        Song(name: "Circles",
             albumName: "Havana album",
             artistName: "Post Malone",
             imageName: "cover11",
             trackName: link+malone),
        Song(name: "comethru",
             albumName: "123 Something",
             artistName: "Jeremy Zucker",
             imageName: "cover12",
             trackName: link+jeremy)
    ]
    
    func viewDidload() {
        view?.setupView()
        view?.navigationBar()
    }
    
    func didSelect(dataModel: [Song]?, indexPath: IndexPath) {
        guard let view = view else { return }
        router?.navigateToPlayer(view, dataModel: dataModel, indexPath: indexPath)
    }
}

extension MusicListPresenter: MusicListInteractorToPresenter {
    
}
