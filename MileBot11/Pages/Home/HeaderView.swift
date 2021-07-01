//
//  HeaderView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI

struct HeaderView: View {
//    @EnvironmentObject var sessionManager: SessionManager

    @State private var isProfilePresented = false
    @State private var isNotificationPresented = false

    var username: String
    
    @State var viewState = CGSize.zero

    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("2021 Year Deductions")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("$432.17")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(Color.black)
                }
                
                Spacer()

                VStack (alignment: .trailing) {
                    HStack {

                        //MARK: - Profile button
                        Button(action: {
                            //action

                            isNotificationPresented.toggle()
                            impact(style: .soft)

                            }) {
                            HStack {
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(width: 38, height: 38, alignment: .center)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(Circle())
                            }
                                .padding(.leading, 7.0)
                        }
                        .sheet(isPresented: $isNotificationPresented) {
                            NotificationsView()
                                .navigationBarBackButtonHidden(true)
                                 .navigationBarHidden(true)
                        }
                        
                        
                        //MARK: - Profile button
                        Button(action: {
                            //action
                            isProfilePresented.toggle()
                            impact(style: .soft)

                            }) {
                                HStack {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 21, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .frame(width: 38, height: 38, alignment: .center)
                                        .background(Color.gray.opacity(0.2))
                                        .clipShape(Circle())
                                }
                                .padding(.leading, 7.0)
                        }
                        .fullScreenCover(isPresented: $isProfilePresented) {
                            ProfileView(username: username)
//                                .environmentObject(sessionManager)

                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: 80)

        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(username: "username")
    }
}
