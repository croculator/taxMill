//
//  ChangePhoneView.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/27/21.
//

import SwiftUI

struct ChangePhoneView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var name: String = ""
    
    var title: String
    var description: String
    var currentNumber: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    VStack (alignment: .leading) {
                            Text("Change Phone Number")
                                .font(.title)
                                .fontWeight(.medium)
                        
                            Text("What you would like your phone number to be updated to?")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .layoutPriority(1)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(ColorManager.UIPurple)
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                        
                        Text("Your number is used for signing in to your account")
                            .layoutPriority(1)
//                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .padding(.vertical)
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Image(systemName: "phone.circle.fill")
                            .foregroundColor(ColorManager.UIPurple)
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                        
                        VStack(alignment: .leading) {
                            Text(currentNumber)
                                .font(.headline)
                            
                            Text("Current Number")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                    
                }
            }
            .padding()
            .padding(.bottom)
            
            VStack (alignment: .leading) {
                Text("New Number")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                
                TextInputView(text: $name, iconName: "phone.fill")
                    .textCase(.lowercase)
                    .autocapitalization(.none)
                    .keyboardType(.numberPad)
            }

            
            Spacer()
            
            Button(action: {
                //action
//                    sessionManager.login(username: username, password: password)
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
        .padding(.top,5.0)
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
//        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarBackButtonHidden(true)
    }
}

struct ChangePhoneView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePhoneView(title: "profile", description: "Basic account info to manage your account", currentNumber: "+1 (293)-485-2991")
    }
}
