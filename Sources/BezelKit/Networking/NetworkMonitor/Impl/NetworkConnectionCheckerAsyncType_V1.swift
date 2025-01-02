//
//  NetworkConnectionCheckerAsyncType_V1.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public struct NetworkConnectionCheckerAsyncType_V1: NetworkConnectionCheckerAsyncType {

  public init() {}

  public var isConnected: Bool {
    return NetworkConnectionHelper.isInternetAvailable()
  }

}
