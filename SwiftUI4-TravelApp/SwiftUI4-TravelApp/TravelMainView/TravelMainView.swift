//
//  TravelMainView.swift
//  SwiftUI4-TravelApp
//
//  Created by M1 on 29.05.2024.
//

import SwiftUI


struct TravelMainView: View {
    
    @StateObject var viewModel: TravelMainViewModel
    @State private var showAlert = false
    @State private var randomTip: Tip?
    @State private var path: [Int] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ScrollView {
                    
                    ForEach(0..<viewModel.destinations.count, id: \.hashValue) { index in
                        
                        NavigationLink(value: index) {
                            ZStack {
                                AsyncImage(url: URL(string: viewModel.destinations[index].poster)) { image in
                                    
                                    image.resizable()
                                        .frame(height: 200)
                                        .scaledToFit()
                                        .cornerRadius(35)
                                } placeholder: {
                                    ProgressView()
                                }
        
                                VStack {
                                    Spacer()
                                    
                                    Text(viewModel.destinations[index].title)
                                    
                                    Spacer(minLength: 10)
                                    
                                    Text(viewModel.destinations[index].shortdescription)
                                        .frame(width: 200, height: 150)
                                    
                                }
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 22)
                            }
                        }
                        .padding(5)
                    }
                }
                .navigationDestination(for: Int.self) { index in
                    TravelDetailView(selectedDestination: viewModel.destinations[index], path: $path)
                    
                }
                
                Spacer()
                
                Button(action: {
                    randomTip = viewModel.randomTip()
                    showAlert = true
                }) {
                    Text("Travel Tips")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(item: $randomTip) { tip in
                    Alert(title: Text("სამოგზაურო რჩევა"), message: Text(tip.text), dismissButton: .default(Text("კაი ჩემო ძმაო!")))
                }
            }
            .padding()
            .background(Color(red: 18/255, green: 25/255, blue: 33/255))
            .navigationTitle("Voyager-ი კაი აჟერი")
        }
        .onAppear {
            viewModel.fetchDestinations()
        }
    }
}

#Preview {
    TravelMainView(viewModel: TravelMainViewModel())
}
