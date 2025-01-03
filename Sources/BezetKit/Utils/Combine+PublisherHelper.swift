//
//  Combine+PublisherHelper.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation
import Combine


public func observePublisher<T>(
  _ publisher: Published<T>.Publisher,
  subscriptions: inout Set<AnyCancellable>,
  dataReceiveScheduler: DispatchQueue = DispatchQueue.main,
  onReceiveData: @escaping (T) -> Void
) {
  publisher
    .receive(on: dataReceiveScheduler)
    .eraseToAnyPublisher()
    .sink { T in
      onReceiveData(T)
    }
    .store(in: &subscriptions)
}
