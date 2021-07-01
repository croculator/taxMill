//
//  DeductionSummaryCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/1/21.
//

import SwiftUI

struct DeductionSummaryCard: View {
    var body: some View {
        VStack {
            HStack {
                
                ZStack {
                    Circle()
                        .frame(width: 28, height: 28, alignment: .center)
                        .foregroundColor(Color.green.opacity(1))
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke(Color.black, lineWidth: 0))
                    
                    Image(systemName: "arrow.up")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .black, design: .rounded))

                }
                
                
                Text("Deductions this year")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .padding()
            
            Text("$1,894")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .padding(.horizontal)
            
            
            HStack {
                Image(systemName: "arrow.up")
                    .foregroundColor(Color.green)
                
                Text("$138.20 (2.21%)")
                    .font(.subheadline)
                    .foregroundColor(Color.green)
                
                Text("Past 1 month")
                    .font(.subheadline)
            }
            .padding()
        }
//        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(ColorManager.CardBG.opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
        .stroke(ColorManager.CardBorder.opacity(1), lineWidth: 0))
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarBackButtonHidden(true)
//        .padding()
        
    }
}

struct DeductionSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        DeductionSummaryCard()
    }
}
