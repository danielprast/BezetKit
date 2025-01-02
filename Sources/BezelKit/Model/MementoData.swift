//
//  MementoData.swift
//  BezelKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


extension BezelKitModule {

  public protocol MementoCareTaker {
    associatedtype Entity: DataEntity & Codable
    func save(_ object: Entity, forKey key: String) throws
    func load(forKey key: String) throws -> Entity
  }

  public protocol MementoEntityCareTaker {
    associatedtype Originator: MementoOriginator
    func save(_ entity: Originator, for key: String) throws
    func load(for key: String) throws -> Originator
  }

  public protocol MementoOriginator: Codable {
    associatedtype OriginatorState: DataEntity & Codable
    var state: OriginatorState { get }
    func update(state: OriginatorState)
  }

}


public typealias MementoCareTaker = BezelKitModule.MementoCareTaker
public typealias MementoEntityCareTaker = BezelKitModule.MementoEntityCareTaker
public typealias MementoOriginator = BezelKitModule.MementoOriginator
