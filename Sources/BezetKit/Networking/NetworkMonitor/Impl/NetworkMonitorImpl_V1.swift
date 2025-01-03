//
//  NetworkMonitorImpl_V1.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 30/12/24.
//

import Foundation
import Network
import Combine


public final class NetworkMonitorImpl_V1: NetworkMonitor, NetworkMonitorObserver {

  private let monitor: NWPathMonitor
  private let queue: DispatchQueue
  private let queueLabel = "NetworkMonitor"

  public init() {
    monitor = NWPathMonitor()
    queue = DispatchQueue(label: queueLabel)
  }

  // MARK: - • Network Monitor Observer

  fileprivate let _networkStatePublisher: PassthroughSubject<NetworkCondition, Never> = .init()

  public var networkStatePublisher: PassthroughSubject<NetworkCondition, Never> {
    return _networkStatePublisher
  }

  // MARK: - • Network Monitor

  public var networkCondition: NetworkCondition {
    return _networkCondition
  }

  fileprivate var _networkCondition: NetworkCondition = .notConnected {
    didSet {
      print("🚀 \(queueLabel): \(networkCondition)")
      _networkStatePublisher.send(networkCondition)
    }
  }

  public func startNetworkMonitoring() {
    monitor.pathUpdateHandler = { [weak self] path in
      guard path.status == .satisfied else {
        self?._networkCondition = .notConnected
        return
      }
      self?._networkCondition = .connected
    }
    monitor.start(queue: queue)
  }

  public func stopNetworkMonitoring() {
    monitor.cancel()
  }

}
