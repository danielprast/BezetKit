//
//  UIAppUtil.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation
import UIKit


public struct UIAppUtil {

  public init() {}

}


extension UIAppUtil {

  @discardableResult
  public static func openUrlIfPossible(_ url: URL) -> Bool {
    guard UIApplication.shared.canOpenURL(url) else {
      return false
    }

    UIApplication.shared.open(
      url,
      options: [:],
      completionHandler: nil
    )

    return true
  }

}
