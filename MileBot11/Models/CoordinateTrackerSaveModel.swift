//
//  CoordinateTrackerSaveModel.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/21/21.
//


import SwiftUI

class CoordinateSaveFile: Identifiable, Codable {

    var coordinates: [Coordinate]
    
    init(coordinates: [Coordinate]) {
        self.coordinates = coordinates
    }
}


//testDB
extension CoordinateSaveFile {
    static var data: [CoordinateSaveFile] {
        []
    }
}


//used for creating a temp Trip Object when making a new tirp
extension CoordinateSaveFile {
    class Data {
        @Published var coordinates = [Coordinate]()
    }
    
    class CoordinateSaveFileReset {
        var coordinates = [Coordinate]()
    }
}
