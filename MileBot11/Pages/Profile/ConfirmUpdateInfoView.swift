//
//  ConfirmUpdateInfoView.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/28/21.
//

import SwiftUI

struct ConfirmUpdateInfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var sessionManager: SessionManager

    @State var challengeResponse = ""
    let updatedInfo: String
    
    var body: some View {
        VStack {
            Text("We sent a confirmation code to ")
            Text(" \(updatedInfo)")
            TextField("Confirmation Code", text: $challengeResponse)
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
                sessionManager.confirmSignIn(confirmationCodeFromUser: challengeResponse)
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
    }
}
struct ConfirmUpdateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmUpdateInfoView(updatedInfo: "username")
    }
}
