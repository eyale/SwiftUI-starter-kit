//
//  LocationManager.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/5/21.
//

import Foundation
import CoreLocation
import Combine
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

  private let locationManager = CLLocationManager()

  @Published var locationStatus: CLAuthorizationStatus?
  @Published var lastLocation: CLLocation?
  @Published var region = MKCoordinateRegion()
  @Published var annotationItems = [MyAnnotationItem]()

  override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }


  public func requestAuthorisation(always: Bool = false) {
    if always {
      self.locationManager.requestAlwaysAuthorization()
    } else {
      self.locationManager.requestWhenInUseAuthorization()
    }
  }

  var statusString: String {
    guard let status = locationStatus else {
      return "unknown"
    }

    switch status {
    case .notDetermined: return "notDetermined"
    case .authorizedWhenInUse: return "authorizedWhenInUse"
    case .authorizedAlways: return "authorizedAlways"
    case .restricted: return "restricted"
    case .denied: return "denied"
    default: return "unknown"
    }
  }

  func locationManager(_ manager: CLLocationManager,
                       didChangeAuthorization status: CLAuthorizationStatus) {
    locationStatus = status
    print(#function, statusString)
  }

  func locationManager(_ manager: CLLocationManager,
                       didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    lastLocation = location
    lastLocation.map {
      let center = CLLocationCoordinate2D(latitude: $0.coordinate.latitude,
                                          longitude: $0.coordinate.longitude)
      let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

      region = MKCoordinateRegion(center: center, span: span)

      annotationItems = [MyAnnotationItem(coordinate: center)]

    }
    print(#function, location)
  }

}

struct MyAnnotationItem: Identifiable {
  let id = UUID()
  var coordinate: CLLocationCoordinate2D
}
