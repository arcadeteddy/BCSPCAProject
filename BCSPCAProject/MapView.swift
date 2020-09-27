//
//  MapView.swift
//  BCSPCAProject
//
//  Created by Theodore Lau on 2020-09-27.
//  Copyright © 2020 Theodore Lau. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  var locationManager = CLLocationManager()
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
      let coordinate = CLLocationCoordinate2D(
          latitude: 49.2827, longitude: -123.1207)
      let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      uiView.setRegion(region, animated: true)
  }
}
