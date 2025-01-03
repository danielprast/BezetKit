//
//  NiblessView.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import UIKit


open class NiblessView: UIView {

  public override init(frame: CGRect) {
    super.init(frame: frame)
  }

  @available(*, unavailable,
    message: "Loading this view from a nib is unsupported."
  )
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view from a nib is unsupported.")
  }

}
