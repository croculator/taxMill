//
//  RideRow.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/25/21.
//

import SwiftUI
import MapKit

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct RideRow: View {
    
    var ride: Ride
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
            HStack {
                VStack (alignment: .trailing) {
                    Text("$\(ride.deductionValue, specifier: "%.2f")")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("\(ride.distance, specifier: "%.2f")mi")
                        .font(.body)
                        .foregroundColor(Color.gray)
                }
                
                Spacer()

                
                VStack {
                    Text("\(ride.startDate, formatter: Self.taskDateFormat)")

                        .font(.body)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, -1)
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 80, height: 20, alignment: .center)
                            .foregroundColor(Color.yellow.opacity(1))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.yellow, lineWidth: 0))
                        
                        Text("\(ride.deductionType)")
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundColor(Color.black)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
                

                
            
        Line()
          .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(height: 1)
            .opacity(0.2)
            .padding(.horizontal)
            .offset(x: 0, y: -0.5)
        }

            

            
            
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: 75)
        .background(Color.gray.opacity(0.05))
        .padding(.bottom, -8)

//        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
//        .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
//        .stroke(Color.black.opacity(0), lineWidth: 1))
//        .padding(.horizontal)
    }
}

struct RideRow_Previews: PreviewProvider {
    static var previews: some View {
        RideRow(ride: Ride.data[0])
            .previewLayout(.sizeThatFits)
    }
}
