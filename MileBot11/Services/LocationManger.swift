//
//  LocationManger.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/14/21.
//

import Foundation
import CoreLocation
import Combine
import CoreMotion
import SwiftUI
import MapKit
import Polyline

class LocationManager: NSObject, ObservableObject {
    
    //geocode helper function
    var geo = GeoCode()
    
    @Published var coordinateSave: CoordinateSaveFile.Data = CoordinateSaveFile.Data()

    private let locationManager = CLLocationManager()
    private let activityManager = CMMotionActivityManager()
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    //rides DB
    @Published var rides = Ride.data
    
    //new ride struct
    @Published var newRideData: Ride.Data = Ride.Data() { willSet { objectWillChange.send() } }
    
    enum locationServiceState {
        case idle
        case monitoring
    }
    
    enum rideServiceState {
        case idle
        case monitoring
    }
    
    @Published var locationStatePublisher = locationServiceState.idle{ willSet { objectWillChange.send() } }
    @Published var rideServicePublisher = rideServiceState.idle { willSet { objectWillChange.send() } }

    @Published var status: CLAuthorizationStatus? { willSet { objectWillChange.send() } }
    @Published var location = CLLocation() { willSet { objectWillChange.send() } }

    @Published var currentLocation = CLLocationCoordinate2D() { willSet { objectWillChange.send() } }

    @Published var placemark: CLPlacemark? { willSet { objectWillChange.send() } }
    
    @Published var startTracking: Bool = false
//    @Published var isActivityDriving: Bool = false
    
    @State private var currentDate = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var startAddress: String = ""
    var endAddress: String = ""
    


    private var cancellables = Set<AnyCancellable>()



    //MARK: - init
    override init() {

        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //gets a new coordinate every 50 meters
        self.locationManager.distanceFilter = 0
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.showsBackgroundLocationIndicator = true
        self.locationManager.allowsBackgroundLocationUpdates = true
//        self.locationManager.pausesLocationUpdatesAutomatically = false
        self.locationManager.activityType = .automotiveNavigation

        
//        newRideData.coordinates
//            .map { coordinates  in
//              return  newRideData.polyline = encodeLocations([CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)])
//            }
        
        $rideServicePublisher
            .print("$rideServicePublisher", to: nil)
            .map {
                $0 == .monitoring
            }
            .assign(to: &$startTracking)
        
        
//        //deduciton by polyline
        newRideData.$polyline
//            .print("polylineDeduction:", to: nil)
            .map { poly -> Double in
                let poly: [CLLocation]? = decodePolyline(poly)
                let distance = poly?.totalDistance ?? -1
                print("polylineDeduction:\(distance * 0.57)")

                return distance * 0.57
            }
            .assign(to: \.newRideData.deductionValue, on: self)
            .store(in: &cancellables)
        
        
//        //total distance by polyline
        newRideData.$polyline
//            .print("polylineDistance:", to: nil)
            .map { poly -> Double in
                let poly: [CLLocation]? = decodePolyline(poly)
                let distance = poly?.totalDistance ?? -1
                print("polylineDistance:\(distance)")
                return distance
            }
            .assign(to: \.newRideData.distance, on: self)
            .store(in: &cancellables)
        

//            //make polyline
        coordinateSave.$coordinates
//            .print("polylineString:", to: nil)
            .map { coordinate -> String in
                let points: [CLLocationCoordinate2D] = coordinate.map {
                    CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
                }

                let polyline = Polyline(coordinates: points)
                let encodedPolyline: String = polyline.encodedPolyline
                
                print("polylineString:\(encodedPolyline)")
                print("byte lenght: \(encodedPolyline.count.byteSize)")//12

                return encodedPolyline
            }
            .assign(to: \.newRideData.polyline, on: self)
            .store(in: &cancellables)
    }
    
    
    func trackEndTime() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
                self.newRideData.endDate = Date() 
    //            differenceInSeconds = newRideData.startDate.timeIntervalSince(newRideData.endDate)
                //print(self.newRideData.endDate)
                if self.newRideData.rideStarted == false{
                    timer.invalidate()
                }
            }
        }
    }

    
    func startNewRide() {
        startLocationService()
        newRideData.rideStarted = true
        newRideData.startDate = Date()
        trackEndTime()
        
        print("\n--------------------")
        print("-----startNewRide()-----")
        print("--------------------\n")
    }
    
    func endRide() {
        
        //import polyline
        let newPoly = Polyline(encodedPolyline: newRideData.polyline)
        
        //decode polyline into an array of coordinates
        let decodedCoordinates: [CLLocationCoordinate2D]? = newPoly.coordinates
        
        //get the first coordinate in the array and assign it to a variable
        let startAddressCoor =  CLLocation(latitude: (decodedCoordinates?.first?.latitude)!, longitude: (decodedCoordinates?.first?.longitude)!)
        
        //save start coordinate
        newRideData.startCoordinate = Coordinate(latitude: startAddressCoor.coordinate.latitude, longitude: startAddressCoor.coordinate.longitude)
                
        //get the last coordinate in the array and assign it to a variable
        let endAddressCoor = CLLocation(latitude: (decodedCoordinates?.last!.latitude)!, longitude: (decodedCoordinates?.last!.longitude)!)
        
        //save end coordinate
        newRideData.endCoordinate = Coordinate(latitude: endAddressCoor.coordinate.latitude, longitude: endAddressCoor.coordinate.longitude)
        
        //reverse geocode the first coordinate to get the address
            //the save the address to the current ride
        geo.reverseGeocode(location: startAddressCoor, handler: { location in
            self.newRideData.startAddress = location!
            
            //reverse geocode the last coordinate to get the address
                //the save the address to the current ride
            self.geo.reverseGeocode(location: endAddressCoor, handler: { location02 in
                self.newRideData.endAddress = location02!
                
                print("\n--------------------")
                print("-----endRide()-----")
                print("--------------------\n")
                
                
                
                //stop GPS and other location things
                self.stopLocationService()
                
                //trigger the service that the ride is done
                self.newRideData.rideStarted = false
                self.newRideData.endDate = Date()
                
                
                //print the "Ride" to console
                print("Distance:            \(self.newRideData.distance)mi")
                print("Deduction Value:     $\(self.newRideData.deductionValue)")
                print("Deduction Type:      \(self.newRideData.deductionType)")
                print("Start Date:          \(self.newRideData.startDate)")
                print("End Date:            \(self.newRideData.endDate)")
                print("Start Address:       \(self.newRideData.startAddress)")
                print("End Address:         \(self.newRideData.endAddress)")
                print("Start Coordinate:    \(self.newRideData.startCoordinate)")
                print("End Coordinate:      \(self.newRideData.endCoordinate)")
                print("--Polyline--")
                print("\(self.newRideData.polyline)")


                print("------------------------------")
                print(self.rides.endIndex - 1)

                //save to DB
                self.saveNewRide()
                
                //reset the datapoints of the "current ride" so a new ride can be stared
                self.resetRide()

                })
            })
    }
    
    
    //start GPS location service
    func startLocationService() {
        locationStatePublisher = .monitoring
//        guard locationPublisher != .monitoring else {
//            return
//        }
//        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        print("location service started!")
    }
    
    //stop GPS location service
    func stopLocationService() {
        locationStatePublisher = .idle

//        guard locationPublisher == .monitoring else {
//            return
//        }
        locationManager.stopUpdatingLocation()
//        locationManager.stopUpdatingHeading()
        print("location service stopped!")
    }
    
    
    //stop motion activity service
    func stopActivityService() {
        self.activityManager.stopActivityUpdates()
        self.locationManager.stopUpdatingLocation()
        print("activity service stopped!")
    }
    
    //MARK: - Databse
    func saveNewRide () {
        if coordinateSave.coordinates.totalDistanceCoordinate > 0.01 {
            let newRide = Ride(rideStarted: newRideData.rideStarted,
                               polyline: newRideData.polyline,
                               distance: newRideData.distance,
                               deductionValue: newRideData.deductionValue,
                               deductionType: newRideData.deductionType,
                               startDate: newRideData.startDate,
                               endDate: newRideData.endDate,
                               startAddress: newRideData.startAddress,
                               endAddress: newRideData.endAddress,
                               startCoordinate: newRideData.startCoordinate,
                               endCoordinate: newRideData.endCoordinate)

            self.rides.append(newRide)
            print("ride appended to DB")
        } else {
            print("not far enough!!!!  AAAAHHHHHHhh")
        }
    }
    
    func resetRide() {
        coordinateSave.coordinates.removeAll()
        newRideData.polyline.removeAll()
        newRideData.distance = 0
        newRideData.deductionValue = 0
        print("\n--------------------")
        print("-----ride reset-----")
        print("--------------------\n")

    }
}


extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        //if you are going 0mph to 7mph
        if locationManager.distanceFilter != 8 && location.speed > 0 && location.speed < 4 {
            locationManager.distanceFilter = 8
            print("-----distance filter set to 5m-----\n")
            
            //if you are going 7mph to 30mph
        } else if locationManager.distanceFilter != 15 && location.speed > 4 && location.speed < 13 {
            locationManager.distanceFilter = 15
            print("-----distance filter set to 15m-----\n")
            
            //if you are going above 30mph
        } else if locationManager.distanceFilter != 50 && location.speed > 13 {
            locationManager.distanceFilter = 50
            print("-----distance filter set to 50m-----\n")
        }
        print(location.coordinate)
        coordinateSave.coordinates.append(Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
//        print(newRideData.coordinates)
        
    }
}

extension CLLocation {
    var latitude: Double {
        return self.coordinate.latitude
    }
    
    var longitude: Double {
        return self.coordinate.longitude
    }
}

// MARK: - Calculate total distance
//called using .totalDistance after an array of type CLLocation
extension Array where Element == Coordinate {
    /// Returns the total distance of the list of CLLocation objects in miles
    /// to convert to meters take out the "1609"
    var totalDistanceCoordinate: CLLocationDistance {
        return reduce((0.0, nil), { (($0.0 + CLLocation(latitude: $1.latitude, longitude: $1.longitude).distance(from: $0.1 ?? CLLocation(latitude: $1.latitude, longitude: $1.longitude)) / 1609), CLLocation(latitude: $1.latitude, longitude: $1.longitude)) }).0
    }
}

extension Array where Element: CLLocation {
    
    /// Returns the total distance of the list of CLLocation objects.
    var totalDistance: CLLocationDistance {
        return reduce((0.0, nil), { (($0.0 + $1.distance(from: $0.1 ?? $1) / 1609), $1) }).0
    }
}

extension Notification.Name {
    static let Test = Notification.Name(rawValue: "Test")
}

extension Int {
    var byteSize: String {
        return ByteCountFormatter().string(fromByteCount: Int64(self))
    }
}
