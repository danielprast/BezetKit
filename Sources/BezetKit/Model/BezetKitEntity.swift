//
//  BezetKitEntity.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public protocol DataEntity {}


public protocol BezetKitEntity: DataEntity {
  var id: String { get }
}
