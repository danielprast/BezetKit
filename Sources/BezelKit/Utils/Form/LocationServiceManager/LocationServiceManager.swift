//
//  LocationServiceManager.swift
//  EcareKit
//
//  Created by Daniel Prastiwa on 07/10/24.
//

import CoreLocation


public final class LocationServiceManager: NSObject {

  public let locationManager = CLLocationManager()
  public weak var delegate: LocationServiceManagerDelegate?
  public private(set) var coordinates: [LocationCoordinate] = []
  public private(set) var isUpdatingLocation = false

  public init(delegate: LocationServiceManagerDelegate? = nil) {
    super.init()
    self.delegate = delegate
    locationManager.delegate = self
    locationManager.distanceFilter = kCLDistanceFilterNone
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }

  public func requestLocationAccessAuthorization() {
    locationManager.requestWhenInUseAuthorization()
  }

  public func startUpdatingLocation() {
    locationManager.startUpdatingLocation()
    isUpdatingLocation = true
  }

  public func stopUpdatingLocation() {
    locationManager.stopUpdatingLocation()
    isUpdatingLocation = false
  }

  public func checkForLocationAccessPermission() {

    switch locationManager.authorizationStatus {

    case .authorizedWhenInUse, .authorizedAlways:
      startUpdatingLocation()
      delegate?.onDidAuthorizeLocationAccess()

    case .notDetermined:
      delegate?.showPermissionHandlerAlertToEncourageLocationAccessInitially()

    case .denied, .restricted:
      delegate?.showAlertPromptToAllowLocationAccessViaSetting()

    default:
      break
    }
  }

  public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    checkForLocationAccessPermission()
  }

  public func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    nlog("did update locations", locations)

    coordinates = locations.map {
      LocationCoordinate.init(
        latitude: $0.coordinate.latitude,
        longitude: $0.coordinate.longitude
      )
    }

    guard !locations.isEmpty else {
      return
    }

    let coordinate = locations.first!.coordinate
    let result = LocationCoordinate(
      latitude: Double(coordinate.latitude),
      longitude: Double(coordinate.longitude)
    )

    delegate?.locationDidUpdate(location: result)
  }

}


extension LocationServiceManager: CLLocationManagerDelegate {}


public protocol LocationServiceManagerDelegate: AnyObject {
  func onDidAuthorizeLocationAccess()
  func showAlertPromptToAllowLocationAccessViaSetting()
  func showPermissionHandlerAlertToEncourageLocationAccessInitially()
  func locationDidUpdate(location: LocationCoordinate)
}


extension LocationServiceManagerDelegate {
  public func onDidAuthorizeLocationAccess() {}
  public func locationDidUpdate(location: LocationCoordinate) {}
}
