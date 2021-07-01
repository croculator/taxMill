//
//  TrackingCard.swift
//  MileBot11
//
//  Created by Michael Diaz on 6/12/21.
//

import SwiftUI
import MapKit


struct TrackingCard: View {
    @Binding var isTrackingFocused: Bool
    @Binding var isActionMenuPresented: Bool
    @State private var isDeductionType: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
//    var region = MKCoordinateRegion()
//    var lineCoordinates =  [CLLocationCoordinate2D]()
    
    @Binding var region: MKCoordinateRegion
    @Binding var lineCoordinates: [CLLocationCoordinate2D]
    var currentLocation: CLLocationCoordinate2D
    
    //var ride: Ride.Data
    @Binding var rideStarted: Bool
    @Binding var distance: Double
    @Binding var deduction: Double
    @Binding var deductionType: String
    var encodedPolyline: String
    @Binding var startDate: Date
    @Binding var endDate: Date

    var endRide: () -> Void
    var resetRide: () -> Void
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
                    ZStack (alignment: .top) {
                        VStack {
                            TrackingMap(currentLocation: currentLocation, encodedPolyline: encodedPolyline)
                              .edgesIgnoringSafeArea(.all)
                            
                            VStack {
                                Text("Tax Deduction")
                                Text("$\(deduction, specifier: "%.2f")")
                                    .font(.system(size: 44, weight: .semibold, design: .rounded))
                            }
                            .padding()
                            .padding(.top,20)
                            
                            HStack {
                                VStack {
                                    Text("Distance")
                                    Text("\(distance, specifier: "%.2f")miles")
                                        .font(.title2)
                                }
                                Spacer()
                                VStack {
                                    Text("Time")
//                                    Text("\(ride.endDate.timeIntervalSince(ride.startDate), specifier: "%.0f")s")
                                    Text("\(timeString(time: Int(endDate.timeIntervalSince(startDate))))")
                                        .onReceive(timer) { input in
                                            endDate = input
                                        }
                                        .font(.title2)
                                    
//                                    Text("\(endDate)")
//                                        .onReceive(timer) { input in
//                                            endDate = input
//                                        }
                                }
                            }
                            .padding()

                            //end trip
                            Button(action: {
                                        //action
                            //            presentationMode.wrappedValue.dismiss()
//                                        rideStarted = false
//                                        isTrackingFocused = false
//                                        endRide()
                                        isDeductionType = true
                                        
                                        }) {
                                        HStack {
                                            Text("End Trip")
                                                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                                                .background(Color.purple.opacity(0.8))
                                                .font(.system(size: 21, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                    .stroke(ColorManager.UIPurple, lineWidth: 0))
                                        }
                                        .padding()
                                        .padding(.bottom, 40)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(1))
                        .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .stroke(ColorManager.CardBorder.opacity(0), lineWidth: 1))
                        
                        Button(action: {
                            //action
                            presentationMode.wrappedValue.dismiss()
                            isTrackingFocused = false
//                            isTracking = true
//                           isActionMenuPresented = false
                            }) {
                            VStack {
                                HStack {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 19, weight: .black, design: .rounded))
                                        .foregroundColor(Color.black.opacity(0.7))
                                        .frame(width: 38, height: 38, alignment: .center)
                                        .background(Color.gray.opacity(0.4))
                                        .clipShape(Circle())
                                    
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 30)
                            .padding(.vertical, 50)
                        }
                        
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text("Home"))
                    .edgesIgnoringSafeArea([.top, .bottom])
                    .navigationBarBackButtonHidden(true)
        
                    .if(isDeductionType) {
                        $0.overlay(
                        VStack {
                            Spacer()
                            
                            //end ride with delivery selected
                            Button(action: {
//                                locationManager.startNewRide()
                                withAnimation {
                                    rideStarted = false
                                    isTrackingFocused = false
                                    deductionType = "Delivery"
                                    endRide()
                                }
                            }) {
                                    SelectionButton(text: "Delivery")
                                        .padding()
                            }

                            
                            //go back
                            Button(action: {
                                withAnimation {
                                    isDeductionType = false
                                }
                            }) {
                                SelectionButton(text: "Cancel")
                                        .padding()
                            }
                            Spacer()
                        }
                        .background ( VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)))
                        .ignoresSafeArea(.all),
                        alignment: .bottom)
                    }
    }
    


    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

//struct TrackingCard_Previews: PreviewProvider {
//
//    private var region = MKCoordinateRegion(
//      // Apple Park
//      center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
//      span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//    )
//
//    private var lineCoordinates = [
//
//      // Steve Jobs theatre
//      CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495),
//
//      // Caffè Macs
//      CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356),
//
//      // Apple wellness center
//      CLLocationCoordinate2D(latitude: 37.336901, longitude:  -122.012345)
//    ];
//
//
//    static var previews: some View {
//        TrackingCard(isTracking: .constant(true), isTrackingFocused: .constant(true), isActionMenuPresented: .constant(false), region: region, lineCoordinates: lineCoordinates)
//    }
//}
