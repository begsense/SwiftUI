//
//  HeaderView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Image("popcorn")
                    .resizable()
                    .frame(width: 45, height: 45)
                
                Spacer()
                
                Text ("Movies")
                    .font(.title2)
                
                Spacer()
                
                Image("movies")
                    .resizable()
                    .frame(width: 45, height: 45)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 70)
        .background(Color(red: 100/255, green: 40/255, blue: 130/255, opacity: 0.3))
        .cornerRadius(30)
        .opacity(0.8)
    }
}

#Preview {
    HeaderView()
}
