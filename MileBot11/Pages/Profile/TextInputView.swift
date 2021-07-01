//
//  TextInputView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/31/21.
//

import SwiftUI

struct TextInputView: View {
    @Binding var text: String
    var iconName: String
    

    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(ColorManager.UIPurple.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(Color.black, lineWidth: 0))
                
                Image(systemName: iconName)
                    .foregroundColor(ColorManager.UIPurple)
                    .font(.system(size: 21, weight: .medium, design: .rounded))
            }


            TextField("\(text)", text: $text)
                .font(.title3)
                .padding(.leading)
            
        }
        .padding(20.0)
        .background(Color.gray.opacity(0.1))
        .font(.headline)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 15, style: .continuous)
        .stroke(Color.gray.opacity(0.2), lineWidth: 1))
        .padding(.horizontal)

    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(text: .constant("text"), iconName: "person.fill")
    }
}
