//
//  CombineDebouncer.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public class CombineDebouncer: NSObject {

  public let callback: (() -> Void)
  public let delay: Double
  public weak var timer: Timer?

  public init(
    delay: Double,
    callback: @escaping (() -> Void)
  ) {
    self.delay = delay
    self.callback = callback
  }

  deinit {
    timer?.invalidate()
  }

  public func call() {
    timer?.invalidate()
    let nextTimer = Timer.scheduledTimer(
      timeInterval: delay,
      target: self,
      selector: #selector(CombineDebouncer.fireNow),
      userInfo: nil,
      repeats: false
    )
    timer = nextTimer
  }

  @objc public func fireNow() {
    self.callback()
  }

}
