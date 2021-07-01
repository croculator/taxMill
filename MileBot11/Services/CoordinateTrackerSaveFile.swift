//
//  CoordinateTrackerSaveFile.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/21/21.
//

    
import SwiftUI

class CoordinateTrackerSaveFile: ObservableObject {
    
    @Published var coordinateSaveFile: [CoordinateSaveFile] = []

    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
        
        private static var fileURL: URL {
            return documentsFolder.appendingPathComponent("coordinateSaveFile.data")
        }
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.coordinateSaveFile = CoordinateSaveFile.data
                }
                #endif
                return
            }
            guard let coordinateSaveFile = try? JSONDecoder().decode([CoordinateSaveFile].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.coordinateSaveFile = coordinateSaveFile
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let coordinateSaveFile = self?.coordinateSaveFile else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(coordinateSaveFile) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
            
        
    
    
    
}

