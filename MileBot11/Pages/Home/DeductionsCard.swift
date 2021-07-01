//
//  DeductionsCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/31/21.
//

import SwiftUI

struct DeductionsCard: View {
    var body: some View {
        VStack{
            HStack {
                
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                
                VStack (alignment: .leading) {
                    Text("Nov 14-27")
                        .font(.title2)
                    
                    Text("Summary")
                        .font(.headline)
                        .foregroundColor(ColorManager.UIPurple)
                        .padding(.bottom, 1.0)
                }
                Spacer()
            }
            .padding()
            
            
            VStack {
                HStack {
                    Text("Deductions")
                        .font(.system(size: 17, weight: .regular, design: .rounded).smallCaps())
                        .foregroundColor(Color.gray)

                    Spacer()
                    
                    Text("$138.30")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .padding()
            
            Spacer()
        }
//        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(ColorManager.CardBG.opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(ColorManager.CardBorder.opacity(1), lineWidth: 1))
//        .padding()
    }
}

struct DeductionsCard_Previews: PreviewProvider {
    static var previews: some View {
        DeductionsCard()
    }
}
