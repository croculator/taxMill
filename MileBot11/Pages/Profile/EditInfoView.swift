//
//  EditInfoView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/31/21.
//

import SwiftUI
import AudioToolbox

struct EditInfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var name: String = ""
    
    var title: String
    var description: String

    var body: some View {
        ZStack (alignment: .topLeading) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text(title)
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(alignment: .leading)
                            .padding(.bottom, 1)
                        
                        Text(description)
                            .font(.body)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
                .padding()
                
                TextInputView(text: $name, iconName: "person.fill")
                
                Spacer()
                

                
                
            }
            .padding(.top, 70.0)

            
            Button(action: {
                //action
                presentationMode.wrappedValue.dismiss()
                }) {
                VStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 19, weight: .black, design: .rounded))
                            .foregroundColor(Color.black.opacity(0.7))
                            .frame(width: 38, height: 38, alignment: .center)
//                            .background(Color.gray.opacity(0.4))
                            .clipShape(Circle())
                        
                        Spacer()
                    }
                }
                .padding()
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
//        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarBackButtonHidden(true)
    }
}

struct EditInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditInfoView(title: "profile", description: "Basic account info to manage your account")
    }
}
