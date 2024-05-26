//
//  StoreView.swift
//  SwiftUI3 - ClassWork30
//
//  Created by M1 on 26.05.2024.
//

import SwiftUI

struct StoreView: View {
    //MARK: Properties:
    @ObservedObject var viewModel = StoreViewModel()
    
    //MARK: View:
    var body: some View {
        VStack {
            HStack {
                Image("fruitAndVegetables")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text("სურსათი")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
            }
            
            ScrollView {
                ForEach(viewModel.products, id: \.id) { product in
                    HStack {
                        Image(product.imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                            
                            Text("\(product.price, specifier: "%.2f") ლ")
                                .foregroundColor(.gray)
                            
                            if product.stock == 0 {
                                Text("Out of stock")
                                    .foregroundColor(.red)
                            }
                        }
                        Spacer()
                        
                        HStack {
                            Button(action: { viewModel.removeFromCart(product: product) }) {
                                Image(systemName: "minus.circle")
                            }
                            
                            Text("\(product.quantity)")
                                .padding(.horizontal, 10)
                            
                            Button(action: { viewModel.addToCart(product: product) }) {
                                Image(systemName: "plus.circle")
                            }
                        }
                        
                        Button(action: { viewModel.deleteFromCart(product: product) }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .padding(.leading, 10)
                    }
                    .padding()
                    .background(product.stock == 0 ? Color.gray.opacity(0.5) : Color.clear)
                    .cornerRadius(10)
                }
            }
            
            Button(action: { viewModel.applyDiscount() }) {
                Text(viewModel.isDiscountApplied ? "ფასი დაკლებულია" : "20% ფასდაკლება")
                    .foregroundColor(.primary)
                    .padding()
                    .background(viewModel.isDiscountApplied ? Color.gray : Color.green)
                    .cornerRadius(10)
            }
            .padding(10)
            .disabled(viewModel.isDiscountApplied)
            
            HStack {
                Text("რაოდენობა: \(viewModel.totalItems)")
                
                Spacer()
                
                Text("სულ: \(viewModel.totalCost, specifier: "%.2f") ლ")
                
                Spacer()
                
                Button(action: {
                    UIApplication.shared.open(viewModel.googleUrl)
                }) {
                    Text("ყიდვა")
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                        .background(LinearGradient(colors: [Color(red: 43/255, green: 43/255, blue: 255/255), Color(red: 23/255, green: 23/255, blue: 207/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                }
            }
        }
        .padding(10)
    }
}

//MARK: Preview:

#Preview {
    StoreView()
}
