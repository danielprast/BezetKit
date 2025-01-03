//
//  KTPNumberValidator_V1.swift
//  Created by Daniel Prastiwa on 25/11/24.
//

import Foundation


public struct KTPNumberValidator_V1: KTPNumberValidator {

  public init() {}

  private let inputLimit: Int = 16

  public func validate(_ number: String) -> Bool {
    if number.count < inputLimit {
      return false
    }
    return true
  }

  public func isValidCountWhenTyping(_ number: String) -> Bool {
    return number.count <= inputLimit
  }

}
