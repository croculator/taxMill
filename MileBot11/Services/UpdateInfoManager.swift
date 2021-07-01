//
//  UpdateInfoManager.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/28/21.
//


import Foundation
import SwiftUI
import Amplify


enum SecurityCheckFlow {
    case verifyIdentity
    case confirmUpdateInfo(updatedInfo: String)
    
    case addEmail
    case updateEmail
    case updatePhoneNumber
    case updatePassword
}

final class UpdateInfoManager: ObservableObject {
    @Published var securityCheckFlow: SecurityCheckFlow = .verifyIdentity
    
    
    //MARK: - Reset Password
    func updateEmail(email: String) {
        Amplify.Auth.update(userAttribute: AuthUserAttribute(.email, value: email)) {[weak self] result in
            do {
                let updateResult = try result.get()
                
                switch updateResult.nextStep {
                case .confirmAttributeWithCode(let deliveryDetails, let info):
                    print("Confirm the attribute with details send to - \(deliveryDetails) \(String(describing: info))")
                    
                    
                    DispatchQueue.main.async {
                        self?.securityCheckFlow = .confirmUpdateInfo(updatedInfo: email)
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
