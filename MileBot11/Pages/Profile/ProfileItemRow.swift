//
//  ProfileItemRow.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/29/21.
//

import SwiftUI

struct ProfileItemRow: View {
    
    var title: String
    var description: String
    
    var body: some View {
        //MARK: - List row Reports
        HStack {
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
            
            VStack (alignment: .leading) {
                Text(title)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .padding(.bottom, 0.0)
                
                Text(description)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            
//            Image(systemName: "chevron.right")
//                .font(.headline)
//                .opacity(0.4)

        }
        .padding(.horizontal)
        .padding(.vertical, 10.0)
    }
}

struct ProfileItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItemRow(title: "Title", description: "Description")
    }
}
