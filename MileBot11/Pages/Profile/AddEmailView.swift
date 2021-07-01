//
//  AddEmailView.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/27/21.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var name: String = ""
    
    var title: String
    var description: String
    
    var body: some View {
//        ZStack (alignment: .topLeading) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Add an email")
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
                
                TextInputView(text: $name, iconName: "mail.fill")
                    .textCase(.lowercase)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                
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
                
                
            }
            .padding(.top, 40.0)

            
//            Button(action: {
//                //action
//                presentationMode.wrappedValue.dismiss()
//                }) {
//                VStack {
//                    HStack {
//                        Image(systemName: "arrow.backward")
//                            .font(.system(size: 19, weight: .black, design: .rounded))
//                            .foregroundColor(Color.black.opacity(0.7))
//                            .frame(width: 38, height: 38, alignment: .center)
////                            .background(Color.gray.opacity(0.4))
//                            .clipShape(Circle())
//
//                        Spacer()
//                    }
//                }
//                .padding()
//            }
            

            
//        }
//        .navigationBarHidden(true)
//        .navigationBarTitle(Text("Home"))
//        .edgesIgnoringSafeArea([.top, .bottom])
//        .navigationBarBackButtonHidden(true)
    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView(title: "profile", description: "Basic account info to manage your account")
    }
}
