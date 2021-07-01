//
//  WeeklyRideOverviewCardView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI

struct WeeklyRideOverviewCardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("Nov 14-27")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    
                    Text("This week Estimated Deductions")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 1.0)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            Spacer()
                
                HStack {
                    VStack (alignment: .leading) {

                        Text("Deductions")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        
                        
                        Text("$187.20")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)

                    }
                    
                    Spacer()

                    VStack (alignment: .trailing) {
                        
                        Text("Miles Driven")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        
                        Text("1,540.20 mi")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)

                    }
                }
                .padding(.horizontal)
            
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(ColorManager.UIPurple.opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
        .stroke(Color.black.opacity(0), lineWidth: 1))
//        .padding(.horizontal)

        
    }
}

struct WeeklyRideOverviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyRideOverviewCardView()
            .previewLayout(.sizeThatFits)
    }
}
