//
//  FileDownloadWorker.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public protocol FileDownloadWorker {

  /// Perform downloading particular file.
  /// - Parameters:
  ///   - url: URL to download
  ///   - fileName: The fileName with extension, e.g.: someFile.pdf
  ///   - completion: The completion handler to call when the load request is complete. This handler is executed in Main Thread. Return destination file URL
  func performDownload(
    url: URL,
    fileName: String,
    completion: @escaping (Result<DestinationFileURL, BezelKitError>) -> Void
  )

}
