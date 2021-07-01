//
//  ActionMenu.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/13/21.
//

//import SwiftUI
//
//struct ActionMenu: View {
//    @Binding var isActionMenuPresented: Bool
//    @Binding var isTracking: Bool
//    @Binding var isTrackingFocused: Bool
//    
//    var body: some View {
//        NavigationView {
//        VStack {
//            Spacer()
//            
//            NavigationLink(
//                destination: TrackingCard(isTracking: $isTracking, isTrackingFocused: $isTrackingFocused, isActionMenuPresented: $isActionMenuPresented, )
//            ) {
//                HStack {
//                    Text("Start Tracking Miles")
//                        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
//                        .background(Color.purple.opacity(0.8))
//                        .font(.system(size: 21, weight: .semibold, design: .rounded))
//                        .foregroundColor(.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .stroke(ColorManager.UIPurple, lineWidth: 0))
//                }
//                .padding()
//                .padding(.bottom, 40)
//            }
////            .onTapGesture {
////                isTracking = true
////                isTrackingFocused = false
////            }
//            
//            
//            
////            VStack {
////                Button(action: {
////                            //action
////                //            presentationMode.wrappedValue.dismiss()
////                            isTracking = true
////                            isActionMenuPresented = false
////
////                            }) {
////                            HStack {
////                                Text("Start Tracking Miles")
////                                    .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
////                                    .background(Color.purple.opacity(0.8))
////                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
////                                    .foregroundColor(.white)
////                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
////                                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
////                                        .stroke(ColorManager.UIPurple, lineWidth: 0))
////                            }
////                            .padding()
////                            .padding(.bottom, 40)
////                }
////
////            }
//
//
//            
//            
//            Button(action: {
//                        //action
//                        
//                        }) {
//                        HStack {
//                            Text("Export Logs")
//                                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
//                                .background(Color.purple.opacity(0.8))
//                                .font(.system(size: 21, weight: .semibold, design: .rounded))
//                                .foregroundColor(.white)
//                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                    .stroke(ColorManager.UIPurple, lineWidth: 0))
//                        }
//                        .padding()
//                        .padding(.bottom, 40)
//
//            }
//            
//            
//            Button(action: {
//                        //action
//                        isActionMenuPresented = false
//                        }) {
//                        HStack {
//                            Text("Go back")
//                                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
//                                .background(Color.purple.opacity(0.8))
//                                .font(.system(size: 21, weight: .semibold, design: .rounded))
//                                .foregroundColor(.white)
//                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                    .stroke(ColorManager.UIPurple, lineWidth: 0))
//                        }
//                        .padding()
//                        .padding(.bottom, 40)
//            }
//            Spacer()
//
//        }
//        }
//        
//
//    }
//}
//
//struct ActionMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionMenu(isActionMenuPresented: .constant(true), isTracking: .constant(false), isTrackingFocused: .constant(false))
//    }
//}
