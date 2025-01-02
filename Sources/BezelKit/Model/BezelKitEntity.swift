//
//  BezelKitEntity.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public protocol DataEntity {}


public protocol BezelKitEntity: DataEntity {
  var id: String { get }
}
