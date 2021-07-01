//
//  SelectionButton.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/14/21.
//

import SwiftUI

struct SelectionButton: View {
    @State private var isPressed: Bool = false
    var text = ""
    var body: some View {
        HStack {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                .background(Color.purple.opacity(0.8))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(ColorManager.UIPurple, lineWidth: 0))
                .scaleEffect(isPressed ? 1.3 : 1.0)
        }
    }
}

struct SelectionButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectionButton()
    }
}
