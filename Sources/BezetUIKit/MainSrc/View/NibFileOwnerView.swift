//
//  NibFileOwnerView.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 11/01/25.
//

import Foundation


open class NibFileOwnerView: FileOwnerNibView {

  open override func setupView() {
    super.setupView()
    backgroundColor = .clear
    contentView?.backgroundColor = .clear
  }

  open func onDeinit() {
    print("Memory reclaimed for \(nibName)!")
  }

  deinit {
    onDeinit()
  }

}
