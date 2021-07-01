//
//  NotificationsView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/28/21.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack (alignment: .top) {
            VStack {
                List {
                    NotificationRow(title: "")
                    NotificationRow(title: "")
                    NotificationRow(title: "")
                    NotificationRow(title: "")
                }
                .padding(.top, 60)
            }
            
            
            HStack {
                Button(action: {
                    //action
                    presentationMode.wrappedValue.dismiss()
                    }) {
                    VStack {
                        HStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 19, weight: .black, design: .rounded))
                                .foregroundColor(Color.black.opacity(0.7))
                                .frame(width: 38, height: 38, alignment: .center)
                                .background(Color.gray.opacity(0.4))
                                .clipShape(Circle())
                            
                        }
                    }
                    .padding()
                }
                Spacer()

                Text("Notifications")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    //action
                    presentationMode.wrappedValue.dismiss()
                    }) {
                    VStack {
                        HStack {
                            Image(systemName: "gear")
                                .font(.system(size: 19, weight: .black, design: .rounded))
                                .foregroundColor(Color.black.opacity(0.7))
                                .frame(width: 38, height: 38, alignment: .center)
                                .background(Color.gray.opacity(0.4))
                                .clipShape(Circle())
                            
                        }
                    }
                    .padding()
                }

            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
