//
//  NotificationView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/28/21.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack (alignment: .topTrailing) {
            HStack {
//                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .font(.headline)
                    .padding(.horizontal)
                    .opacity(0.2)
            }
            .padding()
        
        VStack {
            
            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    Text("Quarterly Taxes!")
                        .font(.headline)
//                        .padding(.bottom, 1.0)
                
    //                            .padding(.bottom, 1.0)
                
                    Text("Due May 18, if you owe more than $1000 in tax for this year.")
                        .font(.subheadline)
                        .foregroundColor(Color.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        Spacer()
                        Text("Learn More")
                            .font(.subheadline)
                        Image(systemName: "arrow.right")
                            .font(.subheadline)
                    }
                    .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)

        }
        .padding(.top, 25)
        .padding(.bottom)
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(Color.gray.opacity(0))
//        .padding(.bottom, -8)
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
        .stroke(Color.black.opacity(0.15), lineWidth: 1))
        .padding(.horizontal)
        }
//        .padding(.vertical)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .previewLayout(.sizeThatFits)
    }
}
