//
//  NetworkServiceWireframe.swift
//  NetworkService
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
import Domains
public protocol NetworkServiceWireframe: class {
    func showServiceOff()
    func showGenericDowntime(errorResponse: ErrorResponse)
}
