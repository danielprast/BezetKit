//
//  FileOwnerNibView.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation
import UIKit
import LBTATools


open class FileOwnerNibView: UIView {

  public var contentView: UIView?
  public var bundleOrNil: Bundle?
  public var hierarchyNotReady = true

  public override init(frame: CGRect) {
    super.init(frame: frame)
    onInit()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    onInit()
  }

  open func onInit() {
    setupBundle()
    let nib = UINib(nibName: nibName, bundle: self.bundleOrNil)
    guard let contentView = nib.instantiate(withOwner: self).first as? UIView else {
      return
    }
    self.contentView = contentView
    setupView()
  }

  open func setupBundle() {
    bundleOrNil = nil
    fatalError("Must define bundle by overriding setupBundle()")
  }

  open func setupView() {
    guard let contentView = self.contentView else { return }
    addSubview(contentView)
    contentView.fillSuperview()
  }

  open var nibName: String { "\(Self.self)" }

}
