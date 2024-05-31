//
//  TravelDetailView.swift
//  SwiftUI4-TravelApp
//
//  Created by M1 on 29.05.2024.
//

import SwiftUI

struct TravelDetailView: View {
    
    @State var selectedDestination: Destination!
    @Binding var path: [Int]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text(selectedDestination.title)
                    
                    AsyncImage(url: URL(string: selectedDestination!.cover))
                        .frame(width: 450 ,height: 200)
                        .scaledToFit()
                        .cornerRadius(15)
                    
                    Text(selectedDestination.description)
                        .frame(maxWidth: 330, maxHeight: 300)
                    
                    Spacer(minLength: 20)
                    
                    HStack {
                        NavigationLink(destination: TransportView(info: selectedDestination, path: $path)) {
                            Text("Transport")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: MustSeeView(info: selectedDestination)) {
                            Text("Must See")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: HotelsView(info: selectedDestination)) {
                            Text("Top Hotels")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                    }
                }
                .foregroundColor(.white)
            }
        }
        .background(Color(red: 18/255, green: 25/255, blue: 33/255))
    }
}
