//
//  UpdateEmailView.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/28/21.
//

import SwiftUI

struct UpdateEmailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isConfirmationCode = false



    @State private var name: String = ""
    
    var title: String
    var description: String
    var currentEmail: String
    
    var sessionManager: SessionManager
    
    var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Update Email Address")
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(alignment: .leading)
                            .padding(.bottom, 1)
                        
                        Text("Enter an email address you would like connect to your account. This is additionally used as account security in case you forget your first email.")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                    .padding(.bottom)

                    Spacer()
                }
                .padding()
                
                
                HStack {
                    Image(systemName: "phone.circle.fill")
                        .foregroundColor(ColorManager.UIPurple)
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                    
                    VStack(alignment: .leading) {
                        Text(currentEmail)
                            .font(.headline)
                        
                        Text("Current Email address")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                
                
                VStack (alignment: .leading) {
                    Text("New Email Address")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .padding(.horizontal)
                    
                    TextInputView(text: $name, iconName: "mail.fill")
                        .textCase(.lowercase)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }

                
                Spacer()
                
                Button(action: {
                    //action
                    sessionManager.updateEmail(email: name)
                    isConfirmationCode.toggle()
                    }) {
                        HStack {
                            Text("Next")
    //                            .padding(20.0)
                                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                                .background(Color.purple.opacity(0.8))
                                .font(.system(size: 21, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.black, lineWidth: 0))
    //                            .padding(.horizontal)
                        }
                }
                .padding()
                .fullScreenCover(isPresented: $isConfirmationCode) {
                    ConfirmUpdateInfoView(updatedInfo: currentEmail)
                        .navigationBarBackButtonHidden(true)
                         .navigationBarHidden(true)
                }
                
                
                Button(action: {
                    //action
                    presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text("Cancel")
                        }
                }
                .padding(5)
                .padding(.bottom)
                
                
            }
            .padding(.top, 50.0)
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
//            .edgesIgnoringSafeArea([.top, .bottom])
            .navigationBarBackButtonHidden(true)
    }
}

struct UpdateEmailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmailView(title: "profile", description: "Basic account info to manage your account", currentEmail: "email@email.com", sessionManager: SessionManager())
    }
}
