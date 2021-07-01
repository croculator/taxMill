//
//  HelpCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/28/21.
//

import SwiftUI

struct HelpCard: View {
    var title: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            Text(title)
                .font(.headline)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .frame(width: 135, height: 135, alignment: .leading)
        .background(Color.gray.opacity(0))
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
        .stroke(Color.black.opacity(0.15), lineWidth: 1))
//        .padding(.horizontal)
    }
}

struct HelpCard_Previews: PreviewProvider {
    static var previews: some View {
        HelpCard(title: "Mile Tracking Banking")
            .previewLayout(.sizeThatFits)
    }
}
