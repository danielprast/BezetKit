//
//  BoxingData.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//


import Foundation


public class BoxingData<T> {

  public typealias Listener = ((T) -> Void)
  public var listener: Listener?

  public var value: T {
    didSet {
      listener?(value)
    }
  }

  public init(_ v: T) {
    self.value = v
  }

  public func bind(_ listener: Listener?){
    self.listener = listener
  }

  public func bindAndFire(_ listener: Listener?) {
    self.listener = listener
    listener?(value)
  }

}
