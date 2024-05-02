//
//  MapModelView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/19.
//

import Foundation
import SwiftUI
import MapKit

struct MapModelView: UIViewRepresentable {

  let region: MKCoordinateRegion
  let lineCoordinates: [CLLocation]

  // Create the MKMapView using UIKit.
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    mapView.region = region
    return mapView
  }

  // We don't need to worry about this as the view will never be updated.
  func updateUIView(_ view: MKMapView, context: Context) {}

  // Link it to the coordinator which is defined below.
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

}

class Coordinator: NSObject, MKMapViewDelegate {
  var parent: MapView

  init(_ parent: MapView) {
    self.parent = parent
  }
}
