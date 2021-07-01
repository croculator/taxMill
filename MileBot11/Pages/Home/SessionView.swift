//
//  SessionView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI
import Amplify

struct SessionView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var user: AuthUser
    let userAttributes: UserAttributes
    @State private var isDeductionsPresented: Bool = false
    
    @Binding var rides: [Ride]
    
    var body: some View {
        NavigationView {

            ZStack {
                VStack {
                    HeaderView(username: user.username)
                
                    ScrollView {
                        NavigationLink(
                            destination: DeductionsOverview(rides: $rides)
                        ) {
                            DeductionSummaryCard()
                                .frame(height: 200)
                                .padding(.vertical, 1)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        }
                            
                        WeatherCard()
                            .frame(height: 70)
                            .padding(.vertical, 1)
                            .padding(.horizontal)
                        
                        
                        
                        VStack {
                            Text("username - \(sessionManager.userAttributes.username)")
                                .padding()
                            Text("email - \(sessionManager.userAttributes.email)")
                                .padding()
                            Text("phone - \(sessionManager.userAttributes.phoneNumber)")
                                .padding()
                            Text(userAttributes.userID)
                                .padding()
                        }

                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text("Home"))
                    .edgesIgnoringSafeArea([.top, .bottom])
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarBackButtonHidden(true)
    }
}


struct SessionView_Previews: PreviewProvider {
    private struct DummyUser: AuthUser {
        let userId: String = "1"
        let username: String = "dummy"
    }
    
    private struct DummyUserAttributes {
        let userId: String = "1"
        let username: String = "dummy"
        let email: String = "dummy@gmail.com"

    }
    static var previews: some View {
        SessionView(user: DummyUser(), userAttributes: UserAttributes(userID: "1", username: "Dummy", email: "dummy@gmail.com", phoneNumber: "+15555551234"), rides: .constant([Ride.data[0]]))
    }
}
