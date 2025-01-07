//
//  UIStackView+Extensions.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 08/01/25.
//

import Foundation
import UIKit


extension UIStackView {

  public func getTotalHeight() -> CGFloat {
    return getTotalArrangedViewsHeight() + getTotalSpacing()
  }

  public func getTotalArrangedViewsHeight() -> CGFloat {
    if axis == .horizontal {
      return bounds.height
    }
    return arrangedSubviews
      .map { $0.bounds.size.height }
      .reduce(0,+)
  }

  public func getTotalSpacing() -> CGFloat {
    let spacingCount = arrangedSubviews.count - 1
    return spacing * CGFloat(spacingCount)
  }

}
