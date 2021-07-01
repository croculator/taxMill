//
//  PasswordRecoveryConfirmView.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/26/21.
//

import SwiftUI

struct PasswordRecoveryConfirmView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    @State private var email = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Reset password")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))

                Spacer()

                Text("Confirmation Code")
                
                TextField("confirmation code here", text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(20.0)
                    .background(Color.gray.opacity(0.2))
                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.black, lineWidth: 0))
                    .padding(.horizontal)
                
                
                Text("New Password")
                
                TextField("new password", text: $email)
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
//                    sessionManager.showLogin()
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
//                    sessionManager.resetPassword(username: email)
                    }) {
                        HStack {
                            Text("Reset password")
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

struct PasswordRecoveryConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryConfirmView()
    }
}
