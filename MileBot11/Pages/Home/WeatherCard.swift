//
//  WeatherCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/31/21.
//

import SwiftUI

struct WeatherCard: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 9, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                
                VStack (alignment: .leading) {
                    Text("78º")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Los Angeles")
                        .font(.headline)
                        .foregroundColor(ColorManager.UIPurple)
                        .padding(.bottom, 1.0)
                }
                .padding(.trailing,35)
                Spacer()

                
                VStack (alignment: .leading) {
                    Text("78º")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("1PM")
                        .font(.headline)
                        .foregroundColor(ColorManager.UIPurple)
                        .padding(.bottom, 1.0)
                }

                Spacer()
                
                VStack (alignment: .leading) {
                    Text("63º")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("3PM")
                        .font(.headline)
                        .foregroundColor(ColorManager.UIPurple)
                        .padding(.bottom, 1.0)
                }
                Spacer()

            }
            .padding(.horizontal)
//            .padding(.bottom, 20)

            Spacer()
        }
//        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(ColorManager.CardBG.opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 9, style: .continuous)
        .stroke(ColorManager.CardBorder.opacity(1), lineWidth: 0))
//        .padding()
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard()
    }
}
