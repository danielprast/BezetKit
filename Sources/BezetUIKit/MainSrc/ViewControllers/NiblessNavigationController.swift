//
//  NiblessNavigationController.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import UIKit


open class NiblessNavigationController: UINavigationController {

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(
    *,
     unavailable,
     message: "Loading this view controller from a nib is unsupported."
  )
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  @available(
    *,
     unavailable,
     message: "Loading this view controller from a nib is unsupported."
  )
  required public init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
  }

}
