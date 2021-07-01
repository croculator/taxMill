//
//  ProfileDetails.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/29/21.
//

import SwiftUI

struct ProfileDetails: View {
    @State private var isNotificationPresented = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var sessionManager: SessionManager

    var body: some View {

        ZStack (alignment: .topLeading) {
            VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Profile")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                                .padding(.bottom, 1)
                            
                            Text("Basic account info to manage your account")
                                .font(.body)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView {
                        VStack (alignment: .leading) {
                            
                            Text("Account Info")
                                .font(.system(size: 17, weight: .regular, design: .rounded).smallCaps())
                                .foregroundColor(Color.gray)
                                .padding(.horizontal)
                            
                            NavigationLink(
                                destination: UpdateEmailView(title: "E-Mail", description: "the email used for updating user information", currentEmail: sessionManager.userAttributes.email, sessionManager: sessionManager)
                            ) {
                                ProfileItemRow02(title: "email", description: sessionManager.userAttributes.email, iconName: "tray.and.arrow.down.fill")
                                    .foregroundColor(.black)
                            }
                            
                            NavigationLink(
                                destination: ChangePhoneView(title: "Phone Number", description: "Your phone number used on this account", currentNumber: sessionManager.userAttributes.phoneNumber)
                            ) {
                                ProfileItemRow02(title: "Phone Number", description: sessionManager.userAttributes.phoneNumber, iconName: "phone.fill")
                                    .foregroundColor(.black)
                            }
                            
                            
                            Button(action: {
                                //action
                                sessionManager.showSignup()
                                }) {
                                    HStack {
                                        Text("Dont have an account? Sign up!")
                                    }
                            }
                            .padding()
                            
                        }
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text("Home"))
                    .edgesIgnoringSafeArea([.top, .bottom])
                    .navigationBarBackButtonHidden(true)
//                     .navigationBarItems(leading: btnBack)
            }
            .padding(.top, 70.0)

            Button(action: {
                //action
                presentationMode.wrappedValue.dismiss()
                }) {
                VStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 19, weight: .black, design: .rounded))
                            .foregroundColor(Color.black.opacity(0.7))
                            .frame(width: 38, height: 38, alignment: .center)
//                            .background(Color.gray.opacity(0.4))
                            .clipShape(Circle())
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
        
    }
}

struct ProfileDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetails(sessionManager : SessionManager())
    }
}
