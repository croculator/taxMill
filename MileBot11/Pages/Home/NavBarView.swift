//
//  NavBarView.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/26/21.
//

import SwiftUI
import Amplify
import MapKit


extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}

struct NavBarView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var userManager: UserManager
    @StateObject var viewRouter: ViewRouter
    @StateObject var locationManager = LocationManager()


    @State var showPopUp = false
    let user: AuthUser
    let userAttributes: UserAttributes
//    let userAttributes: AuthUserAttribute
//
//    let userEmail: AuthUserAttributeKey
    @State private var isActionMenuPresented: Bool = false

    
    @State private var isTrackingFocused: Bool = false
    @State private var isTracking: Bool = false
    @Namespace var namespace
    
    
    
    @State private var region = MKCoordinateRegion(
      // Apple Park
      center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
      span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    @State private var lineCoordinates = [

      // Steve Jobs theatre
      CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495),

      // Caffè Macs
      CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356),

      // Apple wellness center
      CLLocationCoordinate2D(latitude: 37.336901, longitude:  -122.012345)
    ]



    var body: some View {
//        NavigationView {

            TabView {
                SessionView(user: user, userAttributes: userAttributes, rides: $locationManager.rides)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                Overview(rides: $locationManager.rides)
                    .tabItem {
                        Label("Order", systemImage: "square.and.pencil")
                    }
//                    .fullScreenCover(isPresented: $isTracking, content: {
//                        TrackingCard(isTracking: $isTracking, isTrackingFocused: $isTrackingFocused, isActionMenuPresented: $isActionMenuPresented, region: $region, lineCoordinates: $lineCoordinates)
//                    })
                
            }
//            .onAppear() {
//                userManager.fetchAttributes()
//            }
            
            .if(isTrackingFocused) {
                $0.overlay(
                    TrackingCard(
                        isTrackingFocused:          $isTrackingFocused,
                        isActionMenuPresented:      $isActionMenuPresented,
                        region:                     $region,
                        lineCoordinates:            $lineCoordinates,
                        currentLocation:            locationManager.currentLocation,
                        rideStarted:                $isTracking,
                        distance:                   $locationManager.newRideData.distance,
                        deduction:                  $locationManager.newRideData.deductionValue,
                        deductionType:              $locationManager.newRideData.deductionType,
                        encodedPolyline:            locationManager.newRideData.polyline,
                        startDate:                  $locationManager.newRideData.startDate,
                        endDate:                    $locationManager.newRideData.endDate,
                        endRide:                    locationManager.endRide,
                        resetRide:                  locationManager.resetRide)
                )
            }
            
            .if(!isActionMenuPresented && !isTrackingFocused && !isTracking) {
                $0.overlay(
                    ZStack {
                        Button(action: {
                            isActionMenuPresented = true
                        }) {
                        ActionMenuButton()
//                            .matchedGeometryEffect(id: "card", in: namespace)
//                            .offset(x: -10, y: -60)
//                            .padding()
//                            .padding(.bottom, 60)
//                            .padding(.horizontal)
//                            .frame(height: 65)
                        }
                        .offset(x: -20, y: -70)
                    }, alignment: .bottomTrailing
                )
            }

            //tracking hover window
            .if(isTracking && !isTrackingFocused) {
                $0.overlay(
                    VStack {
                        
                        Button(action: {
                            withAnimation {
//                                isActionMenuPresented = false
//                                isTracking = true
                                isTrackingFocused = true
                            }
                        }) {
                            Spacer()
                            HStack {
                                Text("$\(locationManager.newRideData.deductionValue, specifier: "%.2f")")
                                Spacer()
                                Text("Tracking")
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(ColorManager.CardBG.opacity(1))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(ColorManager.CardBorder.opacity(0), lineWidth: 1))
                    .offset(y: -65)
                    .padding(.horizontal)

                , alignment: .bottom)
            }
            
            .if(isActionMenuPresented) {
                $0.overlay(
                VStack {
                    Spacer()
                    
                    //start tracking miles
                    Button(action: {
                        locationManager.startNewRide()
                        withAnimation {
                            isActionMenuPresented = false
                            isTracking = true
                            isTrackingFocused = true
                        }
                    }) {
                            SelectionButton(text: "Start Tracking Miles")
                                .padding()
                    }

                    
                    //go back
                    Button(action: {
                        withAnimation {
                            isActionMenuPresented = false
                        }
                    }) {
                        SelectionButton(text: "go back")
                                .padding()
                    }
                    Spacer()
                }
                .background ( VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)))
                .ignoresSafeArea(.all),
                alignment: .bottom)
            }
            

        }
//        .navigationBarHidden(true)
//        .navigationBarTitle(Text("Home"))
//        .edgesIgnoringSafeArea([.top, .bottom])
//        .navigationBarBackButtonHidden(true)
//    }
}


struct NavBarView_Previews: PreviewProvider {
    private struct DummyUser: AuthUser {
        let userId: String = "1"
        let username: String = "dummy"
    }

    static var previews: some View {
        NavBarView(viewRouter: ViewRouter(), user: DummyUser(), userAttributes: UserAttributes())
            .environmentObject(UserManager())
    }
}



