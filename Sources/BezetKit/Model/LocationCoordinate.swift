//
//  LocationCoordinate.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public struct LocationCoordinate {

  public let latitude: Double
  public let longitude: Double

  public init(
    latitude: Double = 0.0,
    longitude: Double = 0.0
  ) {
    self.latitude = latitude
    self.longitude = longitude
  }

}
