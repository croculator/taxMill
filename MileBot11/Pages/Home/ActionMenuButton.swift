//
//  ActionMenuButton.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/12/21.
//

import SwiftUI

struct ActionMenuButton: View {
    var body: some View {
//        Button(action: {
//            //action
////            presentationMode.wrappedValue.dismiss()
//            }) {
            VStack {
                HStack {
//                    Spacer()

                    Image(systemName: "plus")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white.opacity(1))
                        .frame(width: 65, height: 65, alignment: .center)
                        .background(Color.blue.opacity(0.8))
                        .clipShape(Circle())
                    
                }
            }
//            .padding()
//        }
    }
}

struct ActionMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionMenuButton()
    }
}
