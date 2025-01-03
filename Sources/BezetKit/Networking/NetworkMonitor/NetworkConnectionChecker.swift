//
//  NetworkConnectionChecker.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public protocol NetworkConnectionChecker {
  var isConnected: Bool { get }
}


public protocol NetworkConnectionCheckerAsyncType {
  var isConnected: Bool { get async }
}
