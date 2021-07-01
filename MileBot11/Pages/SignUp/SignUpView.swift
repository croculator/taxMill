//
//  SignUpView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var sessionManager: SessionManager

//    @State var username = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text(" ")
            Spacer()
            HStack  {
                Text("Sign Up")
                    .font(.system(size: 21, weight: .medium, design: .rounded))
                    .opacity(0.6)
                    .padding()
                Spacer()
            }
            

            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(20.0)
                .textContentType(.emailAddress)
                .background(Color.gray.opacity(0.2))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
                .padding(.horizontal)
            
            TextField("password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(20.0)
                .textContentType(.emailAddress)
                .background(Color.gray.opacity(0.2))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            
            TextField("(555)-555-1234", text: $phoneNumber)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(20.0)
                .textContentType(.username)
                .background(Color.gray.opacity(0.2))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
                .padding(.horizontal)
            
            Button(action: {
                //action
                sessionManager.signUp(email: email, password: password, phoneNumber: phoneNumber)
                }) {
                    HStack {
                        Text("Sign-Up")
                            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                            .background(Color.purple.opacity(0.8))
                            .font(.system(size: 21, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(Color.black, lineWidth: 0))
                    }
                    .padding()
            }
                
            Button(action: {
                //action
                sessionManager.showLogin()
                }) {
                    HStack {
                        Text("Already have an account? Log in.")
                    }
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
