//
//  MusicWireframe.swift
//  Music
//
//  Created by ILHAM on 12/09/20.
//

import Foundation
import UIKit
import Domains

public protocol MusicWireframe: class {
    func fromMusicScreenToPlayer(_ viewcontrollerVC: UIViewController, dataModel: [Song]?, indexPath: IndexPath)
}
