//
//  TrackingMapView.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/12/21.
//

import SwiftUI
import MapKit

struct TrackingMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )

    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea(.all)
        }

    }

}

struct TrackingMapView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingMapView()
    }
}
