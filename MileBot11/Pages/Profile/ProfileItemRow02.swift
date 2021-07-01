//
//  ProfileItemRow02.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/30/21.
//

import SwiftUI




struct ProfileItemRow02: View {
    
    var title: String
    var description: String
    var iconName: String
    
    var body: some View {
        //MARK: - List row Reports
            HStack {
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
                }
                
                VStack {
                    HStack {
                        VStack (alignment: .leading) {
                            Text(title)
                                .font(.system(size: 15, weight: .regular, design: .rounded).smallCaps())
                                .foregroundColor(Color.gray)
                            
                            Text(description)
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .padding(.bottom, 0.0)
                        }
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.headline)
                            .foregroundColor(Color(UIColor.systemGray4))
                    }
                    .padding(.vertical, 10.0)
                    
                    Line()
                      .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(height: 1)
                        .opacity(0.05)
                        .offset(x: 0, y: -0.5)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, -3)
    }
}

struct ProfileItemRow02_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItemRow02(title: "Title", description: "Description", iconName: "person.fill")
    }
}
