//
//  PlusMenu.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/26/21.
//

import SwiftUI

struct PlusMenu: View {
    let widthAndHeight: CGFloat

    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(ColorManager.UIPurple.opacity(1))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                
                
//                Circle()
//                    .foregroundColor(Color.blue)
//                    .frame(width: widthAndHeight, height: widthAndHeight)
                
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(ColorManager.UIPurple.opacity(1))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                
                
//                Circle()
//                    .foregroundColor(Color.blue)
//                    .frame(width: widthAndHeight, height: widthAndHeight)
                
                
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
            .transition(.scale)
        
    }
}

//struct PlusMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        PlusMenu()
//    }
//}
