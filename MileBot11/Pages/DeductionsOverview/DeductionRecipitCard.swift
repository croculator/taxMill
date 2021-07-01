//
//  DeductionRecipitCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/1/21.
//

import SwiftUI

struct DeductionRecipitCard: View {
    var body: some View {
        VStack {
            HStack {
                Text("Driving Deductions")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Spacer()
            }
            
            HStack {
                Text("Deductions")
                    .font(.system(size: 17, weight: .regular, design: .rounded).smallCaps())
                    .foregroundColor(Color(UIColor.gray))
                
                Spacer()
                Text("$138.91")
                    .font(.body)
            }
            
            HStack {
                Text("Miles Driven")
                    .font(.system(size: 17, weight: .regular, design: .rounded).smallCaps())
                    .foregroundColor(Color(UIColor.gray))

                Spacer()
                Text("$1784.20 mi")
                    .font(.body)
            }
            
            
            HStack {
                Text("Trips")
                    .font(.system(size: 17, weight: .regular, design: .rounded).smallCaps())
                    .foregroundColor(Color(UIColor.gray))

                Spacer()
                Text("31")
                    .font(.body)
            }
            
            HStack {
                Text("Hours")
                    .font(.system(size: 17, weight: .regular, design: .rounded).smallCaps())
                    .foregroundColor(Color(UIColor.gray))

                Spacer()
                Text("32.8")
                    .font(.body)
            }
            
        }
        .padding()
    }
}

struct DeductionRecipitCard_Previews: PreviewProvider {
    static var previews: some View {
        DeductionRecipitCard()
    }
}
