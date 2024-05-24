//
//  ContentView.swift
//  Swift 2 - ClassWork29
//
//  Created by M1 on 24.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Mobile App Research", date: "4 Oct", isCompleted: true, color: Color(red: 250/255, green: 203/255, blue: 186/255)),
        Task(title: "Prepare Wireframe for Main Flow", date: "4 Oct", isCompleted: true, color: Color(red: 215/255, green: 240/255, blue: 255/255)),
        Task(title: "Prepare Screens", date: "4 Oct", isCompleted: true, color: Color(red: 250/255, green: 217/255, blue: 255/255)),
        Task(title: "Website Research", date: "5 Oct", isCompleted: false, color: Color(red: 250/255, green: 203/255, blue: 186/255)),
        Task(title: "Prepare Wireframe for Main Flow", date: "5 Oct", isCompleted: false, color: Color(red: 215/255, green: 240/255, blue: 255/255)),
        Task(title: "Prepare Screens", date: "5 Oct", isCompleted: false, color: Color(red: 250/255, green: 217/255, blue: 255/255))
    ]
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text("You have 3 tasks to complete")
                            .foregroundColor(.primary)
                            .font(.custom("Roboto", size: 25))
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Spacer()
                        
                        Spacer()
                        
                        Image("lelasImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 45)
                            .overlay {
                                Circle()
                                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 186/255, green: 131/255, blue: 222/255), Color(red: 217/255, green: 217/255, blue: 217/255)]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .frame(width: 45, height: 46)
                            }
                        
                        Spacer()
                        
                            .overlay {
                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: 20, height: 20)
                                
                                Text("\(calculateCompletedTasks())")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                            }
                            .frame(width: 15, height: 15, alignment: .topTrailing)
                            .offset(x: -15, y: 25)
                    }
                    Spacer()
                    
                    Spacer()
                    
                    Button (action: {
                        for task in tasks.indices {
                            tasks[task].isCompleted = true
                        }
                    }) {
                        Spacer(minLength: 17)
                        
                        Text ("Complete All")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 115/255, green: 171/255, blue: 255/255), Color(red: 70/255, green: 192/255, blue: 194/255)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .font(.custom("Inter", size: 16))
                        
                        Spacer(minLength: 17)
                    }
                }
                .frame(height: 165)
                
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Progress")
                            .padding(.bottom, 5)
                            .font(.custom("Roboto", size: 22))
                        VStack (alignment: .leading) {
                            Text("Daily Task")
                                .font(.custom("Inter", size: 18))
                            
                            Spacer()
                            
                            Text("\(calculateCompletedTasks())/6 Task Completed")
                                .font(.custom("Inter", size: 16))
                            
                            Spacer()
                            
                            HStack {
                                Text(calculateCompletedTasks() == 6 ? "Great Job" : "Keep working")
                                    .font(.custom("Inter", size: 14))
                                
                                Spacer()
                                
                                Text(completionPercentage())
                                    .font(.custom("Inter", size: 18))
                                    .padding(.trailing, 32)
                            }

                            //ეს თავიდან პროგრეს ვიუთი მქონდა და ბოლოს გადავაკეთე რადგან ვიზუალურად ვერ დავამსგავსე მოთხოვნილს... თორე პროგრესვიუთი უფრო მარტივი იყო და ვიუსთან მიმართებაში უფრო დინამიურიც
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .frame(width: 300, height: 18)
                                    .padding(.trailing, 20)
                                    .foregroundColor(Color(red: 59/255, green: 81/255, blue: 114/255))
                                    .opacity(0.25)
                                
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .frame(width: progressPercentage()*300, height: 18)
                                    .padding(.trailing, 20)
                                    .foregroundColor(progressPercentage() < 1 ? Color(red: 115/255, green: 171/255, blue: 255/255) : Color.green)
                                    .opacity(41)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 139, alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 10, trailing: 0))
                        .background(Color("cardColor"))
                        .cornerRadius(10)
                        
                        Text("Completed Tasks")
                            .font(.custom("Roboto", size: 22))
                            .padding(.top, 16)
                        
                        Section() {
                            ForEach(tasks.filter { $0.isCompleted }, id: \.id) { task in
                                ZStack {
                                    
                                    Button (action: {
                                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                            tasks[index].isCompleted.toggle()
                                        }
                                    }) {
                                        HStack {
                                            
                                            VStack {
                                                Text(task.title)
                                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                                HStack {
                                                    Image(systemName: "calendar")
                                                        .frame(width: 15, height: 16, alignment: .leading)
                                                    
                                                    Text(task.date)
                                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .trim(from: 0.2, to: 1.0)
                                            .frame(width: 10, height: 80)
                                            .foregroundColor(task.color)
                                            .offset(x: -170)
                                    }
                                }
                                .padding()
                                .background(Color("cardColor"))
                                .cornerRadius(10)
                            }
                        }
                        
                        Spacer(minLength: 20)
                        
                        Section() {
                            ForEach(tasks.filter { !$0.isCompleted }, id: \.id) { task in
                                Button (action: {
                                    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                        tasks[index].isCompleted.toggle()
                                    }
                                }) {
                                    HStack {
                                        
                                        VStack {
                                            Text(task.title)
                                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            HStack {
                                                Image(systemName: "calendar")
                                                    .frame(width: 15, height: 16, alignment: .leading)
                                                
                                                Text(task.date)
                                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .trim(from: 0.2, to: 1.0)
                                            .frame(width: 10, height: 80)
                                            .foregroundColor(task.color)
                                            .offset(x: -170)
                                    }
                                }
                                .padding()
                                .background(Color("cardColor"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                }
                .padding(EdgeInsets(top: 7, leading: 20, bottom: 0, trailing: 20))
            }
        }
        .background(Color("backgroundColor"))
    }
    
    private func calculateCompletedTasks() -> Int {
        return tasks.filter { $0.isCompleted }.count
    }
    
    private func completionPercentage() -> String {
        let completedCount = calculateCompletedTasks()
        
        switch completedCount {
        case 1: return "~17%"
        case 2: return "+33%"
        case 3: return "50%"
        case 4: return "~66%"
        case 5: return "~83%"
        case 6: return "100%"
        default: return ""
        }
    }
    
    private func progressPercentage() -> Double {
        let completedCount = calculateCompletedTasks()
        
        switch completedCount {
        case 1: return 0.17
        case 2: return 0.33
        case 3: return 0.5
        case 4: return 0.66
        case 5: return 0.83
        case 6: return 1.0
        default: return 0
        }
    }
    
    private func calculateProgressTintColor() -> Color {
        return calculateCompletedTasks() == 6 ? .green : .blue
    }
    
}

struct Task: Identifiable  {
    var id = UUID()
    var title: String
    var date: String
    var isCompleted: Bool
    var color: Color
}

#Preview {
    ContentView()
}
