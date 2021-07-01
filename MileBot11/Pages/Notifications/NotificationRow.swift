//
//  NotificationRow.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/28/21.
//

import SwiftUI

struct NotificationRow: View {
    var title: String
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("May 14")
                .font(.footnote)

                Text("Quarterly Taxes due on May 15")
            
        }
//        .padding()
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(title: "Quarterly Taxes due on May 15")
    }
}
