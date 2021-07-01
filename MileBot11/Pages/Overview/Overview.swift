//
//  Overview.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/17/21.
//

import SwiftUI

struct Overview: View {
    @Binding var rides: [Ride]
    var body: some View {
        NavigationView {

            ScrollView {

                ForEach(rides){ ride in
                    NavigationLink(destination: RideDetail(ride: ride)){
                        VStack{
                            RideRow(ride: ride)
        //                            Text(ride.id!).font(.headline)
        //                            Text("Start: \(ride.startDate)").font(.caption)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview( rides: .constant([Ride.data[0]]))
    }
}
