//
//  NavBarView_old.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/12/21.
//

//
//struct NavBarView_old: View {
//    @EnvironmentObject var sessionManager: SessionManager
//    @StateObject var viewRouter: ViewRouter
//
//    @State var showPopUp = false
//    let user: AuthUser
//    let userAttributes: UserAttributes
////    let userAttributes: AuthUserAttribute
////
////    let userEmail: AuthUserAttributeKey
//
//
//    var body: some View {
//        GeometryReader { geometry in
//                    VStack {
//                        Spacer()
//                        switch viewRouter.currentPage {
//                        case .home:
//                            SessionView(user: user, userAttributes: userAttributes)
//                        case .liked:
//                            Text("Savings")
////                            DeductionsOverview()
//                        case .records:
//                           Text("Savings")
//                        case .user:
//                            Text("Profile")
//                        }
//                        Spacer()
//                        ZStack {
//                            if showPopUp {
//                                PlusMenu(widthAndHeight: geometry.size.width/7)
//                                    .offset(y: -geometry.size.height/6)
//                            }
//                            HStack {
//                                Spacer()
//
//                                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/36, systemIconName: "house", tabName: "Overview")
//                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
//                                Spacer()
//
////                                TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/36, systemIconName: "doc", tabName: "Earnings")
////                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
//
//                                ZStack {
//                                    
//                                    RoundedRectangle(cornerRadius: 3, style: .continuous)
//                                        .frame(width: 50, height: 50, alignment: .center)
//                                        .foregroundColor(ColorManager.UIPurple.opacity(1))
//                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                        .stroke(Color.black, lineWidth: 0))
//                                    
////                                    Circle()
////                                        .foregroundColor(.white)
////                                        .frame(width: geometry.size.width/7, height: geometry.size.width/7)
////                                        .shadow(radius: 4)
//                                    
//                                    Image(systemName: "plus")
//                                        .font(.system(size: 28, weight: .heavy, design: .rounded))
//                                        .foregroundColor(Color.white)
////                                        .resizable()
////                                        .aspectRatio(contentMode: .fit)
////                                        .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
////                                        .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
//                                    
//                                }
//                                    .offset(y: -geometry.size.height/16/2)
//                                    .onTapGesture {
//                                        withAnimation {
//                                            showPopUp.toggle()
//                                        }
//                                    }
//                                
//                                Spacer()
//
//                                TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/36, systemIconName: "doc.text", tabName: "Savings")
//                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
//                                Spacer()
//
//
////                                TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/36, systemIconName: "person", tabName: "Profile")
////                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
//
//                            }
//                                .frame(width: geometry.size.width, height: geometry.size.height/11)
//                            .background(Color.white.opacity(1))
//                        }
//                    }
//                        .edgesIgnoringSafeArea(.bottom)
//                }
//    }
//}


//struct NavBarView_Previews: PreviewProvider {
//    private struct DummyUser: AuthUser {
//        let userId: String = "1"
//        let username: String = "dummy"
//    }
//
//    static var previews: some View {
//        NavBarView(viewRouter: ViewRouter(), user: DummyUser())
//    }
//}
