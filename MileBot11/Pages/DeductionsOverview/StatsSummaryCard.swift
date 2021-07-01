//
//  StatsSummaryCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/28/21.
//

import SwiftUI

struct StatsSummaryCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Driving Deductions")
                .font(.headline)
            
            HStack {
                Text("Miles Driven")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()
                Text("1,784.20 mi")
            }
            
            HStack {
                Text("Trips")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("32")
            }
            
            Spacer()

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(Color.gray.opacity(0))
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
        .stroke(Color.black.opacity(0.15), lineWidth: 1))
        .padding(.horizontal)
    }
}

struct StatsSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        StatsSummaryCard()
            .previewLayout(.sizeThatFits)
    }
}
