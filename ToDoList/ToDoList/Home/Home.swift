//
//  Home.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            
            VStack {
                HomeNavBar()
                ScrollView {
                    HeaderView(name: "Calender", seeAll: "")
                    AnnouncementCard()
                    HeaderView(name: "To day’s tasks")
                    CardTask(name: "Mobile trading", title: "Client Review &Feedback")
                    CardTask(name: "cubes", title: "Client Review &Feedback")
                    HeaderView(name: "My Projects")
                    ProjectCell(name: "bag", title: "Some Purchases", subtitle: "5 tasks",
                                colorCircle: .white, backgroundColor: .lightPink)
                    ProjectCell(name: "cubes", title: "To Do List", subtitle: "3 tasks",
                                colorCircle: .darkGreen, backgroundColor: .lightGreen)
                    Spacer()
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding(.horizontal, 20)
        
    }
}

#Preview {
    Home()
}
