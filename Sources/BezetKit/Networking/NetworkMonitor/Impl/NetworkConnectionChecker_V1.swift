//
//  NetworkConnectionChecker_V1.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public struct NetworkConnectionChecker_V1: NetworkConnectionChecker {

  public init() {}

  public var isConnected: Bool {
    return NetworkConnectionHelper.isInternetAvailable()
  }

}
