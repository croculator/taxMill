//
//  NavBarView_old2.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/14/21.
//

//import SwiftUI
//import Amplify
//
//extension View {
//    @ViewBuilder
//    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
//        if condition { transform(self) }
//        else { self }
//    }
//}
//
//struct NavBarView: View {
//    @EnvironmentObject var sessionManager: SessionManager
//    @StateObject var viewRouter: ViewRouter
//
//    @State var showPopUp = false
//    let user: AuthUser
//    let userAttributes: UserAttributes
////    let userAttributes: AuthUserAttribute
////
////    let userEmail: AuthUserAttributeKey
//    @State private var isActionMenuPresented: Bool = false
//
//    
//    @State private var isTrackingFocused: Bool = false
//    @State private var isTracking: Bool = false
//    @Namespace var namespace
//
//
//    var body: some View {
//        NavigationView {
//
//            TabView {
//                SessionView(user: user, userAttributes: userAttributes)
//                    .tabItem {
//                        Label("Home", systemImage: "house")
//                    }
//
//                Text("overview")
//                    .tabItem {
//                        Label("Order", systemImage: "square.and.pencil")
//                    }
//            }
//            
//            
//            .if(isTracking) {
//                $0.overlay(
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Text("$23.45")
//                            Spacer()
//                            Text("Tracking")
//                        }
//                        .padding()
//                        Spacer()
//                    }
//                    .onTapGesture {
//                        withAnimation(.spring()){
//                        isTrackingFocused.toggle()
//                            isTracking = true
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                    .background(ColorManager.CardBG.opacity(1))
//                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
//                    .stroke(ColorManager.CardBorder.opacity(0), lineWidth: 1))
//                    
//                    
//                    ,
//                    alignment: .bottom
//                )
//            }
//            
//            .if(isActionMenuPresented) {
//            $0.overlay(
//                VStack {
//                    Spacer()
//
//                    Button(action: {
//                                //action
//                        withAnimation(.spring()){
//                            isActionMenuPresented.toggle()
//                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                            isTracking = true
//                        }
//                                }) {
//                                HStack {
//                                    Text("Go back")
//                                        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
//                                        .background(Color.purple.opacity(0.8))
//                                        .font(.system(size: 21, weight: .semibold, design: .rounded))
//                                        .foregroundColor(.white)
//                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                                        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                            .stroke(ColorManager.UIPurple, lineWidth: 0))
//                                    
//
//                                }
//                                .padding()
//                                .padding(.bottom, 40)
//                    }
//                    Spacer()
//                }
//                .matchedGeometryEffect(id: "card", in: namespace)
//                .background ( VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)))
//                .ignoresSafeArea(.all)
//                .transition(
//                    .asymmetric(
//                        insertion: AnyTransition
//                                    .opacity
//                                    .animation(Animation.spring().delay(2)),
//                        removal: AnyTransition
//                            .opacity
//                            .animation(.spring())
//                    )
//                )
//                    .onTapGesture {
//                        withAnimation(.spring()){
////                        isActionMenuPresented.toggle()
//                        }
//                    },
//                alignment: .bottom
//            )
//            }
//        
//        
//            .if(!isActionMenuPresented) {
//            $0.overlay(
//                    ZStack {
//                        ActionMenuButton()
//                            .matchedGeometryEffect(id: "card", in: namespace)
//                            .offset(y: -50)
//                            .padding(.bottom, 20)
//                            .padding(.horizontal)
////                            .frame(height: 65)
//
//                        NavigationLink(destination: TrackingCard(isTracking: $isTracking, isTrackingFocused: $isTrackingFocused, isActionMenuPresented: $isActionMenuPresented), isActive: self.$isTrackingFocused) {
//                            EmptyView()
//                        }
//
////                        VStack {
////                            if isActionMenuPresented {
////                                VStack {
////                                    ActionMenu(isActionMenuPresented: $isActionMenuPresented, isTracking: $isTracking, isTrackingFocused: $isTrackingFocused)
//////                                        .matchedGeometryEffect(id: "card", in: namespace, isSource: isTrackingFocused)
////                                }
////                                .transition(
////                                    .asymmetric(
////                                        insertion: AnyTransition
////                                                    .opacity
////                                                    .animation(Animation.spring().delay(0.3)),
////                                        removal: AnyTransition
////                                            .opacity
////                                            .animation(.spring())
////                                    )
////                                )
////                            }
////                        }
//                    }
//
//
//                    .onTapGesture {
//                        withAnimation(.spring()){
//                        isActionMenuPresented.toggle()
//                        }
//                    },
//                alignment: .bottom)
//
//            }
//            
//        }
//        .navigationBarHidden(true)
//        .navigationBarTitle(Text("Home"))
//        .edgesIgnoringSafeArea([.top, .bottom])
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//
//struct NavBarView_Previews: PreviewProvider {
//    private struct DummyUser: AuthUser {
//        let userId: String = "1"
//        let username: String = "dummy"
//    }
//
//    static var previews: some View {
//        NavBarView(viewRouter: ViewRouter(), user: DummyUser(), userAttributes: UserAttributes())
//    }
//}
