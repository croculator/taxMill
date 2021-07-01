//
//  RideDetail.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/16/21.
//

import SwiftUI
import MapKit

struct RideDetail: View {
    
    var ride: Ride
    var currentLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)

    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            TrackingMap(currentLocation: currentLocation, encodedPolyline: ride.polyline)
        }
        
        VStack {
            Text("Ride Details")
                .padding()

            HStack {
                Text("Distance Traveled")
                Spacer()
                Text("\(ride.distance, specifier: "%.2f")mi")
                    .font(.body)
            }
            .padding(.horizontal)

            HStack {
                Text("Deduction")
                Spacer()
                Text("$\(ride.deductionValue, specifier: "%.2f")")
                    .font(.body)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Deduction Type")
                Spacer()
                Text("\(ride.deductionType)")
                    .font(.body)
            }
            .padding(.horizontal)
            
            
            HStack {
                Text("Ride Started")
                Spacer()
                Text("\(ride.startDate, formatter: Self.taskDateFormat)")
                    .font(.body)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Ride Ended")
                Spacer()
                Text("\(ride.endDate, formatter: Self.taskDateFormat)")
                    .font(.body)
            }
            .padding(.horizontal)
            
            VStack {
                HStack {
                    Text("Start Address")
                    Spacer()
                    Text("\(ride.startAddress)")
                        .font(.body)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("End Address")
                    Spacer()
                    Text("\(ride.endAddress)")
                        .font(.body)
                }
                .padding(.horizontal)
            }
            
            VStack {
                HStack {
                    Text("Start Coordinate")
                    Spacer()
                    Text("\(ride.startCoordinate.latitude) \(ride.startCoordinate.longitude)")
                        .font(.body)
                }
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Text("End Coordinate")
                        Spacer()
                        Text("\(ride.endCoordinate.latitude) \(ride.endCoordinate.longitude)")
                            .font(.body)
                    }
                    .padding(.horizontal)
                
                }
            }
            




            
            Divider()
                .padding()
            
            VStack (alignment: .leading) {
                Text("Start Date")
                Text("\(ride.startDate)")
                    .padding(.bottom)
                Text("End Date")
                Text("\(ride.endDate)")
            }
        }
    }
}

struct RideDetail_Previews: PreviewProvider {
    static var previews: some View {
        RideDetail(ride: Ride.data[0])
    }
}
