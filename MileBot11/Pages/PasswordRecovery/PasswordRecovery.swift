//
//  PasswordRecovery.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/26/21.
//

import SwiftUI

struct PasswordRecovery: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State private var email = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("forgot your password?")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))

                Spacer()

                Text("enter your email below and we will send you further instructions.")
                    .padding()
                
                TextField("yourEmail@email.com", text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(20.0)
                    .background(Color.gray.opacity(0.2))
                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                    .padding(.horizontal)
            }
        
        
            VStack {
                Button(action: {
                    //action
                    sessionManager.showLogin()
                    }) {
                        HStack {
                            Text("Go back to login")
                            Spacer()
                        }
                }
                .padding()
            }
            VStack {
                Button(action: {
                    //action
                    sessionManager.resetPassword(username: email)
                    }) {
                        HStack {
                            Text("Send Reset Code")
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
            }
        }
    }
}

struct PasswordRecovery_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecovery()
    }
}
