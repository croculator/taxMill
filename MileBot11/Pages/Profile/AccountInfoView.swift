//
//  AccountInfoView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/29/21.
//

import SwiftUI

struct AccountInfoView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    
    var body: some View {
        VStack {
            
            //MARK: - Name
            VStack (alignment: .leading) {
                Text("Name")
                    .font(.callout)
                    .bold()
            
                HStack {
                    TextField("name", text: $name)
                        .padding(20.0)
                        .background(Color.gray.opacity(0.1))
                        .font(.headline)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10.0)

            //MARK: - email
            VStack (alignment: .leading) {
                Text("email")
                    .font(.callout)
                    .bold()
            
                HStack {
                    TextField("email", text: $email)
                        .padding(20.0)
                        .background(Color.gray.opacity(0.1))
                        .font(.headline)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10.0)

            
            
            //MARK: - phone
            VStack (alignment: .leading) {
                Text("phone")
                    .font(.callout)
                    .bold()
            
                HStack {
                    TextField("phone", text: $phone)
                        .padding(20.0)
                        .background(Color.gray.opacity(0.1))
                        .font(.headline)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10.0)


            
            

        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
            AccountInfoView()
        
    }
}
