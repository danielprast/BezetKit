//
//  EmailValidator.swift
//  Created by Daniel Prastiwa on 11/12/23.
//

import Foundation


public protocol EmailValidator {
  func validateEmail(_ email: String) -> Bool
}


public typealias EmailValidatorImpl = EmailValidatorImpl_V1
