//
//  ContentView.swift
//  ClassWork28_BegiK
//
//  Created by M1 on 22.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isButtonClicked = false
    
    var body: some View {
        
        ZStack {
            
            Color(red: 25/255, green: 37/255, blue: 43/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("სალამ SwiftUI")
                    .font(.largeTitle)
                    .padding(7)
                    .foregroundColor(.white)
                
                HStack(spacing: 13, content: {
                    CardView(icon: "cardButtonImage", title: "ჯუზონები სმნ", description: "გიყვარს ჯუზონები??", height: 233, backgroundImage: "cardBackgroundImage", backgroundImageWidth: 82, backgroundImageHeight: 182, backgroundColor: Color(red: 247/255, green: 187/255, blue: 54/255))
                    VStack() {
                        CardView(icon: "card2ButtonImage", title: "ჩატაობა", description: "", height: 110, backgroundImage: "card2BackgroundImage", backgroundImageWidth: 97, backgroundImageHeight: 93, backgroundColor: Color(red: 255/255, green: 132/255, blue: 75/155))
                        CardView(icon: "card3ButtonImage", title: "ცეცხლოვანი news", description: "", height: 110, backgroundImage: "card3BackgroundImage", backgroundImageWidth: 66, backgroundImageHeight: 86, backgroundColor: Color(red: 127/255, green: 54/255, blue: 247/155))
                    }
                })
                
                List {
                    ListItemView(title: "ვინ არის ის იდუმალი 31?", description: "გაუმარჯოს ღმერთმა ვინცაა სულ კაი გზაზე ევლოს გახარებულიყოს და გაბედნიერებული")
                    ListItemView(title: "რა დაუწუნა ბარბარემ ნიკის?", description: "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს")
                    ListItemView(title: "რა ზომის ფეხი აქვს ვასოს?", description: "დეველოპერებმა განაცხადეს რომ თუ მას 42 და მეტი ზომა ფეხი აქვს მის მოსმენას აზრი არ აქვს და კომენტარის გარეშე დატოვებენ ლექციას")
                    ListItemView(title: "რა სიმაღლისაა ანჟელა ew?", description: "ანჟელა ew არის მეტრაოთხმოცი, რაც ნიშნავს რომ ის დაახლოებით ტეილორ Swift-ის სიმაღლისაა და დიდი ფეხი აქვს")
                    ListItemView(title: "რატომ გაებუტა ბარბარეს ჭეპეტე?", description: "ამჟამინდელი მონაცემებით ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს და როგორც გაირკვა ანიგნორებს აიგნორებდნენ რაღაც იგნორში.")
                    ListItemView(title: "MVC vs MVVM", description: "აი ეს MVC გასაგებია, მაგრამ MVVM ჩემამდე არ დადის რა, ამ სვიბთ იუაიში სად ვიყენებთ მაგას?")
                    ListItemView(title: "ნეტავ რამდენი ხანი გაგრძელდება ეს?", description: "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?")
                }
                .listStyle(PlainListStyle())
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isButtonClicked.toggle()
                    }) {
                        Image("mainIcon")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                            .foregroundColor(.blue)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 40))
                            .background(.clear)
                            .foregroundColor(isButtonClicked ? .red : .blue)
                    }
                }
            }
            
        }
    }
    
    struct CardView: View {
        var icon: String
        var title: String
        @State var description: String
        var height: CGFloat = 150
        var backgroundImage: String
        var backgroundImageWidth: CGFloat
        var backgroundImageHeight: CGFloat
        @State var backgroundColor: Color
        var body: some View {
            ZStack() {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(backgroundImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: backgroundImageWidth, height: backgroundImageHeight)
                            .padding(backgroundImage == "card2BackgroundImage" ? EdgeInsets(top: 0, leading: 78, bottom: 0, trailing: 0)  : EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                VStack {
                    Spacer()
                    Button(action: {
                        if (icon == "cardButtonImage") {
                            description = "მეც მიყვარს სმნ"
                        } else if (icon == "card2ButtonImage") {
                            backgroundColor = .orange
                        } else {
                            description = "Nick is Dead !"
                        }
                        
                    }) {
                        Image(icon)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .scaledToFill()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }
                    Text(title)
                        .font(.custom("FiraGO", size: 13))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 19)
                        .shadow(color: .black, radius: 5, x: 0, y: 1)
                        .lineLimit(2)
                    Spacer()
                    Spacer()
                    Spacer()
                    Text(description)
                        .font(.custom("SF Pro Display", size: 17))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .frame(width: 165, height: height)
            .background(backgroundColor)
            .cornerRadius(20)
        }
    }
    
    struct ListItemView: View {
        var title: String
        var description: String
        
        var body: some View {
            HStack {
                Image("newsIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                VStack {
                    Text(title)
                        .font(.custom("FiraGO", size: 14))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 19)
                    Text(description)
                        .font(.custom("FiraGO", size: 10))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 15, trailing: 5))
            .background(Color(red: 25/255, green: 37/255, blue: 43/255))
            .listRowBackground(Color.clear)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray),
                alignment: .bottom
            )
        }
    }
}

#Preview {
    ContentView()
}
