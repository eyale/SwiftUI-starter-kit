//
//  MapVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/5/21.
//

import SwiftUI
import MapKit

struct MapVC: View {

  @StateObject var locationManager = LocationManager()  

  var body: some View {
    VStack {
      Map(coordinateRegion: $locationManager.region,
          annotationItems: locationManager.annotationItems) { item in
        MapPin(coordinate: item.coordinate)
      }
    }
    .onAppear{
      locationManager.requestAuthorisation()
    }
    .padding(.top, 20)
  }

}
