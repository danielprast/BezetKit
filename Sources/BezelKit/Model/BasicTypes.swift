//
//  BasicTypes.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation
import Combine


public typealias PublisherResult<T> = AnyPublisher<T, BezelKitError>
public typealias PublisherTask<T> = Future<T, BezelKitError>
public typealias DestinationFileURL = URL


public protocol UsecaseParameter {
  var paramValues: [String:String] { get }
}


public protocol UsecaseDataBody {
  var paramValues: [String:Any] { get }
}
