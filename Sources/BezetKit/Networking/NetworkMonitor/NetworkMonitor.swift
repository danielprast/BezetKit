//
//  NetworkMonitor.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 30/12/24.
//

import Foundation
import Network
import Combine


public protocol NetworkMonitor {
  var networkCondition: NetworkCondition { get }
  func startNetworkMonitoring()
  func stopNetworkMonitoring()
}


public protocol NetworkMonitorObserver {
  var networkStatePublisher: PassthroughSubject<NetworkCondition, Never> { get }
}


public typealias NetworkMonitorImpl = NetworkMonitorImpl_V1
