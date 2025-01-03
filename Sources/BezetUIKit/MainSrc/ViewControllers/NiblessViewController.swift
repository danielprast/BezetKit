//
//  NiblessViewController.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import UIKit


open class NiblessViewController: UIViewController {

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(
    *,
     unavailable,
     message: "Loading this view controller from a nib is unsupported"
  )
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  @available(
    *,
     unavailable,
     message: "Loading this view controller from a nib is unsupported"
  )
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view controller from a nib is unsupported")
  }

  public func showAlertView(
    title: String,
    message: String,
    actionLabel: String = "OK",
    actionHandler handler: ((UIAlertAction) -> Void)?
  ) -> Void {
    let confirmView = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )

    confirmView.addAction(
      UIAlertAction(
        title: actionLabel,
        style: .cancel,
        handler: handler
      )
    )

    self.present(
      confirmView,
      animated: true,
      completion: nil
    )
  }

}
