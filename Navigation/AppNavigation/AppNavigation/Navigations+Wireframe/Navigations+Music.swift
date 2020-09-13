//
//  Navigations+Music.swift
//  AppNavigation
//
//  Created by ILHAM on 12/09/20.
//

import UIKit
import Music
import Domains

extension Navigation: MusicWireframe {
     public func fromMusicScreenToPlayer(_ viewcontrollerVC: UIViewController, dataModel: [Song]?, indexPath: IndexPath) {
        let toViewcontroller = buildMusicPlayerModule(dataModel: dataModel, indexPath: indexPath)
        toViewcontroller.hidesBottomBarWhenPushed = true
       // viewcontrollerVC.navigationController?.pushViewController(toViewcontroller, animated: true)
        viewcontrollerVC.navigationController?.present(toViewcontroller, animated: true, completion: nil)
      }
}
