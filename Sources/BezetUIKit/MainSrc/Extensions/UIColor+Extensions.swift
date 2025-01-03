//
//  UIColor+Extensions.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import UIKit


extension UIColor {

  public static func applyTraitColor(
    lightColor: UIColor,
    darkColor: UIColor
  ) -> UIColor {
    return UIColor { (traits) -> UIColor in
      return traits.userInterfaceStyle == .dark ? darkColor : lightColor
    }
  }

  public static var backgroundIndicatorColor: UIColor {
    return UIColor { (traits) -> UIColor in
      return traits.userInterfaceStyle == .dark ? .black : .white
    }
  }

  public static var whiteElementColor: UIColor {
    return UIColor { (traits) -> UIColor in
      return traits.userInterfaceStyle == .light ? .white : .black
    }
  }

  public static var blackElementColor: UIColor {
    return UIColor { (traits) -> UIColor in
      return traits.userInterfaceStyle == .light ? .black : .white
    }
  }

}
