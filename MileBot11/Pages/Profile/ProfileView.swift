//
//  ProfileView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var sessionManager: SessionManager

    @Environment(\.presentationMode) var presentationMode
    
    var username: String
    
    @State private var showReports = false
    
    @State private var pageSelection: profileSections = .home
    
    enum profileSections {
        case home
        case reports
        case account
        case appearance
        case support
    }
    
    var body: some View {
        NavigationView {

        ZStack (alignment: .top) {
            ScrollView {
                
            //MARK: - Profile Summary
            VStack {
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 90, height: 90, alignment: .center)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                
                Text(sessionManager.userAttributes.email)
                    .font(.system(size: 21, weight: .semibold, design: .rounded))
            }
            .padding(.top, 70.0)
            .padding(.bottom, 25.0)
//            .onAppear() {
//                print("-fetching attributes--")
//                userManager.fetchAttributes()
//            }
            
            
                //small header
            VStack (alignment: .leading) {
                Text("Numbers")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                
                //MARK: - Reports
                NavigationLink(
                    destination: Text("reports")
//                    isActive: $shouldShowPurple
                ) {
                    ProfileItemRow(title: "Reports", description: "Driving mile deducitons")
                        .foregroundColor(.black)
                }
                
                //small header
                VStack (alignment: .leading) {
                    Text("General")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .padding(.horizontal)
                }
                
                //MARK: - Account Details
                NavigationLink(
                    destination: ProfileDetails(sessionManager: sessionManager)
//                    isActive: $shouldShowPurple
                ) {
                    ProfileItemRow(title: "Account", description: "Personal info, password, PIN")
                        .foregroundColor(.black)

                }
                //MARK: - Support
                NavigationLink(
                    destination: Text("Support")
//                    isActive: $shouldShowPurple
                ) {
                    ProfileItemRow(title: "Support", description: "Guides, Questions for the Dev team?")
                        .foregroundColor(.black)
                }
            }
            
            
            //MARK: - Sign-out button
            Button(action: {
                //action
                sessionManager.signOut()
                presentationMode.wrappedValue.dismiss()
//                sessionManager.confirm(username: username, code: confirmationCode)
                }) {
                    HStack {
                        Text("Sign Out")
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .background(Color.blue.opacity(0.8))
                            .font(.system(size: 21, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.black, lineWidth: 0))
                            .padding(.horizontal)
                            .padding(.bottom, 15.0)
                            .padding(.top, 5.0)
                    }
            }
            .padding(.vertical, 20.0)
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
        .edgesIgnoringSafeArea([.top, .bottom])
            
            Button(action: {
                //action
                presentationMode.wrappedValue.dismiss()
                }) {
                VStack {
                    HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 19, weight: .black, design: .rounded))
                            .foregroundColor(Color.black.opacity(0.7))
                            .frame(width: 38, height: 38, alignment: .center)
                            .background(Color.gray.opacity(0.4))
                            .clipShape(Circle())
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(username: "username")
            .environmentObject(SessionManager())
    }
}
