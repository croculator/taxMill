//
//  LogInView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
            Text("Welcome ")
                .font(.system(size: 28, weight: .semibold, design: .rounded))

            }
            .onAppear() {
                sessionManager.getCurrentAuthUser()
                sessionManager.signOut()
                
            }

            Spacer()
            
            HStack  {
                Text("Log in")
                    .font(.system(size: 21, weight: .medium, design: .rounded))
                    .opacity(0.6)
                    .padding()
                Spacer()
            }
            
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(20.0)
                .background(Color.gray.opacity(0.2))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
                .padding(.horizontal)

            SecureField("password", text: $password)
                .padding(20.0)
                .background(Color.gray.opacity(0.2))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
                .padding(.horizontal)
            
            
            HStack {
                Text("Forgot your password?")

                Button(action: {
                    //action
                    sessionManager.showPasswordRecovery()
                    }) {
                        HStack {
                            Text("Reset Password")
                        }
                }
            }
            .padding(.horizontal)
            
            
            Button(action: {
                //action
                sessionManager.login(username: username, password: password)
                }) {
                    HStack {
                        Text("Log-in")
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
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environmentObject(SessionManager())
    }
}
