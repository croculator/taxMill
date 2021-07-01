//
//  UserManager.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/23/21.
//

import SwiftUI
import Amplify

class UserManager: ObservableObject {
    var userAttributes: ([AuthUserAttributeKey]) = [AuthUserAttributeKey]()
    var user: UserAttributes = UserAttributes()
    
    func fetchAttributes() {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .success(let attributes):
                print("User attributes - \(attributes)")
                print("test \(attributes)")
                for attribute in attributes {
                    print(attribute)
                    if attribute.key == .email {
                        self.user.email = attribute.value
                        print("email: \(self.user.email)")
                    }
                    if attribute.key == .phoneNumber {
                        self.user.phoneNumber = attribute.value
                        print("email: \(self.user.phoneNumber)")
                    }
                }
                    
//                self.userAttributes = attributes
            case .failure(let error):
                print("Fetching user attributes failed with error \(error)")
            }
        }
    }
    
    func updateEmail(email: String) {
        Amplify.Auth.update(userAttribute: AuthUserAttribute(.email, value: email)) { result in
            do {
                let updateResult = try result.get()
                switch updateResult.nextStep {
                case .confirmAttributeWithCode(let deliveryDetails, let info):
                    print("Confirm the attribute with details send to - \(deliveryDetails) \(info)")
                case .done:
                    print("Update completed")
                }
            } catch {
                print("Update attribute failed with error \(error)")
            }
        }
    }
    
}
