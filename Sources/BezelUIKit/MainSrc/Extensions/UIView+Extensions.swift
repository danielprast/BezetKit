//
//  UIView+Extensions.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import UIKit


extension UIView {

  public func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }

  public func clearSubviews(completion: @escaping () -> Void = {}) {
    if subviews.isEmpty { return }
    subviews.forEach { $0.removeFromSuperview() }
    completion()
  }

  public func getFirstResponder() -> UIView? {
    if self.isFirstResponder {
      return self
    }

    for subview: UIView in self.subviews {
      let firstResponder = subview.getFirstResponder()
      if nil != firstResponder {
        return firstResponder
      }
    }
    return nil
  }

  public func applyShadowSmooth() {
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowRadius = 15
    layer.shadowOffset = .init(width: 0, height: 1.5)
    layer.shadowOpacity = 0.3
    layer.masksToBounds = false
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }

  public func addShadow(
    color: UIColor,
    size: CGSize,
    radius: CGFloat,
    opacity: Float = 1
  ) {
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOffset = size
    self.layer.shadowRadius = radius
    self.layer.shadowOpacity = opacity
  }

  public func applyMenuCardShadow(color: UIColor = .black) {
    layer.shadowColor = color.cgColor
    layer.shadowRadius = 2
    layer.shadowOffset = .init(width: 0, height: 1.3)
    layer.shadowOpacity = 0.75
  }

}
