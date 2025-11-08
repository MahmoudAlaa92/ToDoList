//
//  CustomTabBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI

enum Tabs {
    case home, today, addTask, prioritiesTask, planned
}

struct CustomTabBar: View {
    
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", image: "home", value: .home) {
                HomeView(calenderVM: CalenderViewModel())
            }
            
            Tab("Today", image: "calender2", value: .addTask) {
                AllTasksView(viewModel: AllTasksViewModel())
            }
            
            Tab("AddTask", image: "addIcon", value: .addTask) {
                AddTask()
            }
            
            Tab("PrioritesTask", image: "flag2", value: .prioritiesTask) {
                PrioritiesTasksView(viewModel: PrioritiesTasksViewModel())
            }
            
            Tab("Planned", image: "planned", value: .planned) {
                PlannedView(PlannedVM: PlannedViewModel())
            }
            
        }.tint(Color.primaryApp)
    }
}

#Preview {
    CustomTabBar()
}
