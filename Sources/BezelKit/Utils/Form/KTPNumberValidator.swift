//
//  KTPNumberValidator.swift
//  Created by Daniel Prastiwa on 25/11/24.
//

import Foundation


public protocol KTPNumberValidator {
  func isValidCountWhenTyping(_ number: String) -> Bool
  func validate(_ number: String) -> Bool
}


public typealias KTPNumberValidatorImpl = KTPNumberValidator_V1
