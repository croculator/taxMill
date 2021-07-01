//
//  ViewRouter.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/26/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}


enum Page {
    case home
    case liked
    case records
    case user
}
