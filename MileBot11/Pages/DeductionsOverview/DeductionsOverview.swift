//
//  DeductionsOverview.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/28/21.
//

import SwiftUI

struct DeductionsOverview: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var timeRangePicker = 0
    
    @Binding var rides: [Ride]


    var body: some View {
        ZStack (alignment: .top) {
            ScrollView {
                
                DeductionSummaryCard()
                    .padding(.top, 70.0)
                    .padding(.bottom, 25.0)
                    .padding(.horizontal)

                Picker(selection: $timeRangePicker, label: Text("Time Range")) {
                    Text("Week").tag(0)
                    Text("Month").tag(1)
                    Text("Year").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                

                
                DeductionRecipitCard()
                
                HStack {
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color.black, lineWidth: 0))
                        
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Recent Trips")
                                .font(.headline)
                                .padding(.bottom, 0.0)
                            
                            Text("• All")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                    Spacer()
                    
                    Button(action: {
                        //action
                        }) {
                            HStack {
                                Text("Filter by")
                                    .font(.subheadline)
                            }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10.0)
                .padding(.top, 15)
                
                ForEach(rides){ ride in
                    NavigationLink(destination: RideDetail(ride: ride)){
                        VStack{
                            RideRow(ride: ride)
//                            Text(ride.id!).font(.headline)
//                            Text("Start: \(ride.startDate)").font(.caption)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
    
//                RideRow()
                
            }
            
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
                        
                        Spacer()
                    }
                }
                .padding()
            }
            
        }
    }
}

struct DeductionsOverview_Previews: PreviewProvider {
    static var previews: some View {
        DeductionsOverview(rides: .constant([Ride.data[0]]))
    }
}
