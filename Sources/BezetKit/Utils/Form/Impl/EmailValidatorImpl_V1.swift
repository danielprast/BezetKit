//
//  EmailValidatorImpl_V1.swift
//  Created by Daniel Prastiwa on 25/11/24.
//

import Foundation


public struct EmailValidatorImpl_V1: EmailValidator {

  public init() {}

  public func validateEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
  }

}
