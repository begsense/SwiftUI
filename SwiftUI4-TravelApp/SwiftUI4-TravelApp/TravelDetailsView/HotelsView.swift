//
//  HotelsView.swift
//  SwiftUI4-TravelApp
//
//  Created by M1 on 30.05.2024.
//

import SwiftUI

struct HotelsView: View {
    var info: Destination!
    
    var body: some View {
        ScrollView {
            ForEach(0..<info.hotels.count, id: \.self) { index in
                VStack(alignment: .center) {
                    Text(info.hotels[index].name)
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    AsyncImage(url: URL(string: info.hotels[index].image))
                        .frame(width: 450 ,height: 200)
                        .scaledToFit()
                        .cornerRadius(15)
                    
                    Text(info.hotels[index].description)
                        .frame(maxWidth: 330, maxHeight: 300)
                    
                    Spacer()
                }
                .padding()
            }
            NavigationLink(destination: TravelMainView(viewModel: TravelMainViewModel())) {
                Text("Back To Main Screen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .foregroundColor(.white)
        .background(Color(red: 18/255, green: 25/255, blue: 33/255))
    }
}
