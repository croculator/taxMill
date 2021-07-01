//
//  MileBot11App.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI
import Amplify
import AWSAPIPlugin
import AWSDataStorePlugin
import AWSCognitoAuthPlugin


@main
struct MileBot11App: App {
    @ObservedObject var sessionManager = SessionManager()
    @ObservedObject var userManager = UserManager()

    @StateObject var viewRouter = ViewRouter()

    
    init() {
        configureAmplify()
        sessionManager.getCurrentAuthUser()
    }

    var body: some Scene {
        WindowGroup {
            switch sessionManager.authState {
            case .login:
                LogInView()
                    .environmentObject(sessionManager)
                
            case .confirmSignInCode(let username):
                ConfirmLogInView(username: username)
                    .environmentObject(sessionManager)
                
            case .signUp:
                SignUpView()
                    .environmentObject(sessionManager)

            case .confirmSignUpCode(let username):
                ConfirmationView(username: username)
                    .environmentObject(sessionManager)

            case .session(let user, let userAttributes):
                NavBarView(viewRouter: viewRouter, user: user, userAttributes: userAttributes)
                    .environmentObject(sessionManager)
                    .environmentObject(userManager)
                
            case .passwordRecovery:
                PasswordRecovery()
                    .environmentObject(sessionManager)
            
            case .passwordRecoveryConfirm:
                PasswordRecoveryConfirmView()
                
            case .confirmUpdateInfo(let updatedInfo):
                ConfirmUpdateInfoView(updatedInfo: updatedInfo)
            }
        }
        
    }
}



func configureAmplify() {
    do {
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        try Amplify.configure()
        print("Amplify configured with auth plugin")
        

    } catch {
        print("Failed to initialize Amplify with \(error)")
    }
}


struct ColorManager {
    // create static variables for custom colors
    static let UIPurple = Color("UIPurple")
    static let SecondaryGray = Color("SecondayGray")
    static let DividerGray = Color("DividerGray")
    static let CardBG = Color("CardBG")
    static let CardBorder = Color("CardBorder")
    static let startTrackBtn_buttonBG = Color("buttonBG")
    static let softBlue = Color("softBlue")
    static let quickAction_lightBlue01 = Color("quickAction_lightBlue01")
    static let quickAction_lightBlue02 = Color("quickAction_lightBlue02")
    static let quickAction_BG01 = Color("quickAction_BG01")
}
