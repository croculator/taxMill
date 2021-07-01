//
//  SessionManager.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import Foundation
import SwiftUI
import Amplify


enum AuthState {
    case signUp
    case login
    case confirmSignUpCode(username: String)
    case confirmSignInCode(username: String)
    case confirmUpdateInfo(updatedInfo: String)
    case session(user: AuthUser, userAttributes: UserAttributes)
    case passwordRecovery
    case passwordRecoveryConfirm
}

final class SessionManager: ObservableObject {
    @Published var authState: AuthState = .login
    
    @Published var userAttributes = UserAttributes(userID: "", username: "", email: "", phoneNumber: "")
    
    func getCurrentAuthUser() {
        if let user = Amplify.Auth.getCurrentUser() {
            
//            fetchAttributes()
            userAttributes.userID = user.userId
            userAttributes.username = user.username
            
            Amplify.Auth.fetchUserAttributes() { result in
                switch result {
                case .success(let attributes):
                    
                    for attribute in attributes {
                        if attribute.key == AuthUserAttributeKey.email {
                            self.userAttributes.email = attribute.value
                        }
                        if attribute.key == AuthUserAttributeKey.phoneNumber{
                            self.userAttributes.phoneNumber = attribute.value
                        }
                    }
                case .failure(let error):
                    print("Fetching user attributes failed with error \(error)")
                }
            }
        
            authState = .session(user: user, userAttributes: userAttributes)
            
        } else {
            authState = .login
        }
    }
    
    func showSignup() {
        authState = .signUp
    }
    
    func showLogin() {
        authState = .login
    }
    
    func showPasswordRecovery() {
        authState = .passwordRecovery
    }
    
    func showPasswordRecoveryConfirm() {
        authState = .passwordRecoveryConfirm
    }
    
    func fetchAttributes() {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .success(let attributes):
                
                for attribute in attributes {
                    if attribute.key == AuthUserAttributeKey.email {
                        self.userAttributes.email = attribute.value
                    }
                }
                print(self.userAttributes)

            case .failure(let error):
                print("Fetching user attributes failed with error \(error)")
            }
        }
    }
    
    func signUp(email: String, password: String, phoneNumber: String) {
        let attributes = [AuthUserAttribute(.email, value: email), AuthUserAttribute(.phoneNumber, value: phoneNumber)]
        let options = AuthSignUpRequest.Options(userAttributes: attributes)
        
        _  = Amplify.Auth.signUp(username: email, password: password, options: options) {[weak self] result in
            switch result {
            case .success(let signupResult):
                print("sign up result", signupResult)
            
                
                switch signupResult.nextStep {
                case .done:
                    print("finished sign up process")
                    
                case .confirmUser(let details, _):
                    print(details ?? "no details")
                    
                    DispatchQueue.main.async {
                        self?.authState = .confirmSignUpCode(username: email)
                    }
                    
                }
            case .failure(let error) :
                print("sign up error", error)
            }
        }
    }
    
    func confirmSignUp(username: String, code: String) {
        _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: code) {[weak self] result in
            switch result {
            case .success(let confirmResult):
                print(confirmResult)
                
                if confirmResult.isSignupComplete {
                    DispatchQueue.main.async {
                        self?.showLogin()
                    }
                    
                    
                }
                
            case .failure(let error):
                print("failed to confirm code: ", error)
            }
        }
    }
    
    func login(username: String, password: String) {
        _ = Amplify.Auth.signIn(username: username, password: password) { [weak self] result in
            switch result {
            case .success(let signInResult):
                print("sign up result", signInResult)

                switch signInResult.nextStep {
                case .done:
                    print("finished sign up process")
                    
                    if signInResult.isSignedIn {
                        DispatchQueue.main.async {
                            self?.getCurrentAuthUser()
                        }
                    }
                    
                case .confirmSignUp(let details):
                    _ = Amplify.Auth.resendSignUpCode(for: username)

                    DispatchQueue.main.async {
                        self?.authState = .confirmSignUpCode(username: username)
//                        AWSMobileClient.default().signIn
                        _ = Amplify.Auth.signIn()

                    }
                    
                case .confirmSignInWithSMSMFACode(let deliveryDetails, let info):
                    print(deliveryDetails)
                    print("SMS code send to \(deliveryDetails.destination)")
                    print("Additional info \(String(describing: info))")

                    DispatchQueue.main.async {
                        self?.authState = .confirmSignInCode(username: username)
                    }

                    
                case .confirmSignInWithCustomChallenge(_):
                    break
                case .confirmSignInWithNewPassword(_):
                    break
                case .resetPassword(_):
                    break
                }

            case .failure(let error):
                print("Log in error: ", error)
            }
        }
    }
    
    
    func confirmSignIn(confirmationCodeFromUser: String) {
        _ = Amplify.Auth.confirmSignIn(challengeResponse: confirmationCodeFromUser) { [weak self] result in
            switch result {
            case .success(let signInResult):
                print(signInResult)
                
                if signInResult.isSignedIn {
                        print("Confirm sign in succeeded. The user is signed in.")
                        DispatchQueue.main.async {
                            self?.getCurrentAuthUser()
                        }
                    } else {
                        print("Confirm sign in succeeded.")
                        print("Next step: \(signInResult.nextStep)")
                        // Switch on the next step to take appropriate actions.
                        // If `signInResult.isSignedIn` is true, the next step
                        // is 'done', and the user is now signed in.
                        
                    }
                
            case .failure(let error):
                print("Confirm sign in failed \(error)")
            }
        }
    }
    
    //MARK: - Sign out
    func signOut() {
        _ = Amplify.Auth.signOut { [weak self] result in
            switch result {
            case .success:
                print("Successfully signed out")
                self?.userAttributes.email = ""
                self?.userAttributes.phoneNumber = ""
                self?.userAttributes.userID = ""
                self?.userAttributes.username = ""

                DispatchQueue.main.async {
                    self?.getCurrentAuthUser()
                }
            case .failure(let error):
                print("Sign out error:", error)
            }
        }
    }
    
    func deleteAccount() {
        
    }
    
    
    //MARK: - Update Password
//    func updatePassword(email: String) {
//        Amplify.Auth.update(userAttribute: AuthUserAttribute(.email, value: email)) { [weak self] result in
//
//            switch result {
//            case .success(let result):
//                print("update password result", result)
//
//                switch result.nextStep {
//                case .done:
//                    print("done resetting password")
//
//                case.confirmAttributeWithCode(let authDeliveryDetails, let info):
//                    print(authDeliveryDetails)
//                    print("recovery code send to \(authDeliveryDetails.destination)")
//                    print("Additional info \(String(describing: info))")
//
//                    DispatchQueue.main.async {
//                        self?.authState = .passwordRecoveryConfirm
//                    }
//                }
//
//            case .failure(let error):
//                print("password update error \(error)")
//
//
//            }
//        }
//
//    }
    
    //MARK: - Reset Password
    func resetPassword(username: String) {
        Amplify.Auth.resetPassword(for: username) { [weak self] result in
            
            switch result {
            case .success(let result):
                print(result)
                
                switch result.nextStep {
                case .done:
                    print("Reset completed")

                case .confirmResetPasswordWithCode(let authDeliveryDetails, let info):
                    print(authDeliveryDetails)
                    print("Confirm reset password with code send to - \(authDeliveryDetails) \(String(describing: info))")
                    print("Additional info \(String(describing: info))")
                    
                    DispatchQueue.main.async {
                        self?.authState = .passwordRecoveryConfirm
                    }
                }
            case .failure(let error):
                print("Reset password failed with error \(error)")
            }
        }
    }
    
    
    
    //MARK: - Reset Password
    func updateEmail(email: String) {
        Amplify.Auth.update(userAttribute: AuthUserAttribute(.email, value: email)) {[weak self] result in
            do {
                let updateResult = try result.get()
                
                switch updateResult.nextStep {
                case .confirmAttributeWithCode(let deliveryDetails, let info):
                    print("Confirm the attribute with details send to - \(deliveryDetails) \(String(describing: info))")
                    
                    
                    DispatchQueue.main.async {
                        self?.authState = .confirmUpdateInfo(updatedInfo: email)
                    }
                    
                case .done:
                    print("Update completed")
                }
            } catch {
                print("Update attribute failed with error \(error)")
            }
        }

    }
    
    func confirmAttribute(confirmCode: String) {
        Amplify.Auth.confirm(userAttribute: .email, confirmationCode: confirmCode) { result in
            switch result {
            case .success():
                print("Attribute verified")
                
                
            case .failure(let error):
                print("Update attribute failed with error \(error)")
            }
        }
    }
}
