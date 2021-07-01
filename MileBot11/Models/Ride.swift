//
//  Ride.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/15/21.
//

import Foundation
import CoreLocation
import Combine



struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
}

class Ride: Identifiable, Codable {
    
    var id: String? = UUID().uuidString
    var rideStarted: Bool
    var polyline: String
    var distance: Double    //13.2 miles
    var deductionValue: Double  //$15.50
    var deductionType: String
    var startDate: Date
    var endDate: Date
    var startAddress: String
    var endAddress: String
    var startCoordinate: Coordinate
    var endCoordinate: Coordinate

    init(id: String? = UUID().uuidString, rideStarted: Bool, polyline: String, distance: Double, deductionValue: Double, deductionType: String, startDate: Date, endDate: Date, startAddress:String, endAddress: String, startCoordinate: Coordinate, endCoordinate: Coordinate) {
        
        self.id = id
        self.rideStarted = rideStarted
        self.polyline = polyline
        self.distance = distance
        self.deductionValue = deductionValue
        self.startDate = startDate
        self.endDate = endDate
        self.startAddress = startAddress
        self.endAddress = endAddress
        self.startCoordinate = startCoordinate
        self.endCoordinate = endCoordinate
        self.deductionType = deductionType
    }
    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case coordinates
//        case distance = "distance"
//        case deductionValue = "deductionValue"
//    }
}


//testDB
extension Ride {
    static var data: [Ride] {
        [
            Ride(rideStarted: false, polyline: "w`fcFxushVWdAg@jC[pCQpCGpCIrCIpCQnC[lCg@fC", distance: 13.2, deductionValue: 2.74, deductionType: "Delivery", startDate: Date(), endDate: Date(), startAddress: "start Address", endAddress: "end Address", startCoordinate: Coordinate(latitude: 37.330828, longitude: -122.007495), endCoordinate: Coordinate(latitude: 37.336083, longitude: -122.007356)),
            Ride(rideStarted: false, polyline: "", distance: 6.2, deductionValue: 1.25, deductionType: "Driving", startDate: Date(), endDate: Date(), startAddress: "start Address", endAddress: "end Address", startCoordinate: Coordinate(latitude: 37.330828, longitude: -122.007495), endCoordinate: Coordinate(latitude: 37.336083, longitude: -122.007356))
        ]
    }
}

//used for creating a temp Trip Object when making a new tirp
extension Ride {
    class Data {
        let objectWillChange = PassthroughSubject<Void, Never>()

        
        @Published var distance: Double = 0    { willSet { objectWillChange.send() } }
        @Published var polyline: String = "" { willSet { objectWillChange.send() } }
        @Published var deductionValue: Double = 0   { willSet { objectWillChange.send() } }
        @Published var deductionType: String = "" { willSet { objectWillChange.send() } }
        @Published var startDate: Date = Date() { willSet { objectWillChange.send() } }
        @Published var endDate: Date = Date() { willSet { objectWillChange.send() } }
        @Published var rideStarted: Bool = false { willSet { objectWillChange.send() } }
        @Published var startAddress: String = "" { willSet { objectWillChange.send() } }
        @Published var endAddress: String = "" { willSet { objectWillChange.send() } }
        @Published var startCoordinate: Coordinate = Coordinate(latitude: 0, longitude: 0)
        @Published var endCoordinate: Coordinate = Coordinate(latitude: 0, longitude: 0)
    }
    
    class DataResetTrip {
        var polyline = ""
        var distance: Double = 0   //13.2 miles
        var deductionValue: Double = 0  //$15.50
        var deductionType: String = ""
        var startAddress: String = ""
        var endAddress: String = ""
        var startCoordinate: Coordinate = Coordinate(latitude: 0, longitude: 0)
        var endCoordinate: Coordinate = Coordinate(latitude: 0, longitude: 0)
    }
}
