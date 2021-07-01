//
//  TabBarIcon.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/26/21.
//

import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
                .padding(.bottom, -4)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.black : .gray)    }
}

//struct TabBarIcon_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarIcon(viewRouter: ViewRouter(), assignedPage: .home, width: <#T##CGFloat#>, height: <#T##CGFloat#>, systemIconName: <#T##String#>, tabName: <#T##String#>)
//    }
//}
