//
//  UIViewController+Extensions.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import UIKit


extension UIViewController {

  public var topbarHeight: CGFloat {
    return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
    (self.navigationController?.navigationBar.frame.height ?? 0.0)
  }

  public func attachViewController(
    _ child: UIViewController,
    to parentView: UIView? = nil
  ) {
    if let parentView = parentView {
      child.view.frame = parentView.bounds
      parentView.addSubview(child.view)
    } else {
      view.addSubview(child.view)
    }

    addChild(child)
    child.didMove(toParent: self)
  }

  public var viewSafeAreaInsets: UIEdgeInsets {
    let window = UIApplication.shared.windows.first
    return window?.safeAreaInsets ?? .zero
  }

  public func remove(viewController child: UIViewController?) {
    guard let child = child else {
      return
    }

    guard child.parent != nil else {
      return
    }

    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }

  public func showPopupDialog(
    title: String = "Perhatian!",
    message: String,
    confirmLabel: String = "OK",
    cancelLabel: String = "Batal",
    confirmAction: @escaping () -> Void = {},
    cancelAction: @escaping () -> Void = {}
  ) {
    let confirmView = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )

    confirmView.addAction(
      UIAlertAction(
        title: confirmLabel,
        style: .default,
        handler: { _ in confirmAction() }
      )
    )

    confirmView.addAction(
      UIAlertAction(
        title: cancelLabel,
        style: .cancel,
        handler: { _ in cancelAction() }
      )
    )

    self.present(confirmView, animated: true)
  }

  public func showToast(
    message : String,
    backgroud: UIColor = UIColor.gray,
    font: UIFont = .systemFont(ofSize: 12.0),
    topPadding: CGFloat = 0
  ) {

    let toastLabel = UILabel(
      frame: CGRect(
        origin: CGPoint(
          x: 0.0,
          y: self.navigationController?.navigationBar.frame.height ?? 0.0 + topPadding
        ),
        size: CGSize(
          width: view.frame.width,
          height: 35
        )
      )
    )
    toastLabel.backgroundColor = backgroud.withAlphaComponent(0.8)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.numberOfLines = 0
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(
      withDuration: 5.0,
      delay: 0.5,
      options: .curveEaseOut,
      animations: {
        toastLabel.alpha = 0.0
      },
      completion: {(isCompleted) in
      toastLabel.removeFromSuperview()
    })
  }

  public func showAlert(
    title: String,
    message: String,
    confirmationLabel label: String = "OK"
  ) -> Void {
    let confirmView = UIAlertController(title: title, message: message, preferredStyle: .alert)
    confirmView.addAction(UIAlertAction(title: label, style: .cancel, handler: nil))

    self.present(confirmView, animated: true, completion: nil)
  }

  public func showAlert(
    title: String,
    message: String,
    confirmationLabel label: String = "OK",
    actionHandler handler: ((UIAlertAction) -> Void)?
  ) -> Void {
    let confirmView = UIAlertController(title: title, message: message, preferredStyle: .alert)
    confirmView.addAction(UIAlertAction(title: label, style: .cancel, handler: handler))

    self.present(confirmView, animated: true, completion: nil)
  }

  public func presentDialogPrompt(
    title: String,
    message: String,
    confirmLabel: String = "OK",
    cancelLabel: String = "Cancel",
    confirmAction: ((UIAlertAction) -> Void)?,
    cancelAction: ((UIAlertAction) -> Void)?
  ) -> Void {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )

    alertController.addAction(
      UIAlertAction(
        title: cancelLabel,
        style: .default,
        handler: cancelAction
      )
    )

    alertController.addAction(
      UIAlertAction(
        title: confirmLabel,
        style: .default,
        handler: confirmAction
      )
    )

    present(
      alertController,
      animated: true,
      completion: nil
    )
  }

}
