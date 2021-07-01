//
//  ConfirmationView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI
import Amplify

struct ConfirmationView: View {
    @EnvironmentObject var sessionManager: SessionManager

    @State var confirmationCode = ""
    let username: String
    
    var body: some View {
        VStack {
            Text("confirm sign up view")
            Text("username: \(username)")
            TextField("Confirmation Code", text: $confirmationCode)
                .textContentType(.oneTimeCode)
                .keyboardType(.numberPad)
                .padding(20.0)
                .background(Color.gray.opacity(0.2))
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black, lineWidth: 0))
                .padding(.horizontal)
            
            Button(action: {
                //action
//                _ = Amplify.Auth.signIn()
                sessionManager.confirmSignUp(username: username, code: confirmationCode)
                }) {
                    HStack {
                        Text("Confirm")
                            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                            .background(Color.purple.opacity(0.8))
                            .font(.system(size: 21, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(Color.black, lineWidth: 0))
                            .padding()
                    }
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(username: "testUsername")
    }
}
