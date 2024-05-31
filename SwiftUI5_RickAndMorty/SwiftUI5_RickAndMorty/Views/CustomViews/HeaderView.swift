//
//  HeaderView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(height: 150)
                .foregroundColor(Color(red: 44/255, green: 70/255, blue: 60/255))
            
            ZStack {
                Image("cover")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(40)
                    .opacity(0.7)
                
                HStack {
                    Image("rick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                    
                    Text("Rick& Morty")
                        .frame(width: 50)
                        .foregroundColor(Color(red: 44/255, green: 170/255, blue: 130/255))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    
                    Image("morty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                .padding(.bottom, -25)
            }
        }
        .frame(height: 150)
        .ignoresSafeArea()
        .background(Color(red: 39/255, green: 43/255, blue: 51/255))
    }
}

#Preview {
    HeaderView()
}
