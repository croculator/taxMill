//
//  TrackingMap.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/14/21.
//

import SwiftUI
import MapKit
import Polyline


struct TrackingMap: UIViewRepresentable {

//    let region: MKCoordinateRegion
//    let lineCoordinates: [CLLocationCoordinate2D]
    var currentLocation: CLLocationCoordinate2D
    var encodedPolyline: String
    let mapView = MKMapView()
    private let mapZoomEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    private let mapZoomEdgeInsetsStart = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)


  func makeUIView(context: Context) -> MKMapView {
    //let mapView = MKMapView()
    mapView.delegate = context.coordinator
    //mapView.region = region
    
    let region = MKCoordinateRegion(
        center: currentLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    mapView.setRegion(region, animated: true)
    mapView.centerCoordinate = currentLocation
    mapView.setCenter(currentLocation, animated: true)
    mapView.userTrackingMode = .follow
    mapView.showsUserLocation = true
    
    //disable intraction
    mapView.isZoomEnabled = false
    mapView.isScrollEnabled = false
    mapView.isUserInteractionEnabled = false


//    var encodedPolyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
//    mapView.addOverlay(encodedPolyline)

    return mapView
  }
    
//func mapViewDidFinishRenderingMap(_ view: MKMapView!, fullyRendered: Bool) {
//    // Your code on rednering completion
//    view.userTrackingMode = .follow
//    print("follow!")
//}

  func updateUIView(_ view: MKMapView, context: Context) {
//    if !mapView.overlays.isEmpty {
//        mapView.removeOverlays(view.overlays)
//    }
    updateOverlays(from: view)
  }
    
    private func updateOverlays(from mapView: MKMapView) {
        mapView.removeOverlays(mapView.overlays)
        let polyline = Polyline(encodedPolyline: encodedPolyline)
        let decodedCoordinates: [CLLocationCoordinate2D]? = polyline.coordinates
        let overlay = MKPolyline(coordinates: decodedCoordinates ?? [CLLocationCoordinate2D](), count: decodedCoordinates?.count ?? 0)
        mapView.addOverlay(overlay)
//        print(decodedCoordinates)
//        if decodedCoordinates?.count ?? 0 < 12 {
//            let region = MKCoordinateRegion(
//                center: currentLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
//
//            mapView.setRegion(region, animated: true)
//            mapView.userTrackingMode = .follow
//        } else {
            setMapZoomArea(map: mapView, polyline: overlay, edgeInsets: mapZoomEdgeInsets, animated: true)
//        }
    }
    
    private func setMapZoomArea(map: MKMapView, polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
        map.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
    }


  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
    
    func removeAppleMapOverlays(_ shouldRemoveMarkers : Bool? = false) {
        let overlays = mapView.overlays
        mapView.removeOverlays(overlays)
        if shouldRemoveMarkers == true {
            let annotations = self.mapView.annotations.filter {
                $0 !== self.mapView.userLocation
            }
            self.mapView.removeAnnotations(annotations)
        }
    }
}


class Coordinator: NSObject, MKMapViewDelegate {
  var parent: TrackingMap

  init(_ parent: TrackingMap) {
    self.parent = parent
  }

  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let routePolyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: routePolyline)
      renderer.strokeColor = UIColor.systemBlue
      renderer.lineWidth = 5
      return renderer
    }
    return MKOverlayRenderer()
  }
}

