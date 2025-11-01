//
//  Home.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var calenderVM: CalenderViewModel
    
    var body: some View {
        ZStack {
            
            VStack {
                HomeNavBar()
                ScrollView {
                    HeaderView(name: "Calender", seeAll: "")
                    ScrollView(.horizontal) {
                        HStack(spacing: 24 * .deviceFontScale) {
                            ForEach(calenderVM.days, id: \.self) { item in
                                CalenderCard(title: item.day,
                                             number: item.number,
                                             progress: item.progress)
                            }
                        }
                        .padding([.horizontal, .vertical], 8 * .deviceFontScale)
                    }
                    .padding(.bottom, 24 * .deviceFontScale)
                    
                    AnnouncementCard()
                    HeaderView(name: "To day’s tasks")
                    TaskCard(imageName: "Mobile trading", title: "Client Review &Feedback")
                    TaskCard(imageName: "cubes", title: "Client Review &Feedback")
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
    HomeView(calenderVM: CalenderViewModel())
}
