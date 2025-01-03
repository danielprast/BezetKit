//
//  Data+Extensions.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


extension Data {

  public var prettyPrintedJSONString: NSString? {
    guard
      let object = try? JSONSerialization.jsonObject(with: self, options: []),
      let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
      let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    else {
      return nil
    }
    return prettyPrintedString
  }

}
