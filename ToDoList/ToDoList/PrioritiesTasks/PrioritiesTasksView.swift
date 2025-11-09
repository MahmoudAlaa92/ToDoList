//
//  PrioritiesTasksView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct PrioritiesTasksView: View {
    
    @State var viewModel: PrioritiesTasksViewModel
    @State var selectedIndex: Int?
    let coordinator: AppCoordinator

    var body: some View {
        ZStack {
            VStack {
                CustomNavBar()
                HeaderView(name: "Today’s Task", seeAll: "See All")
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(Array(viewModel.prioritieItems.enumerated()), id:\.offset) { index, priority in
                            PriorityCircle(title: priority.title,
                                           number: priority.number,
                                           isSelected: selectedIndex == index) {
                                selectedIndex = (selectedIndex == index ? nil : index)
                            }
                        }
                    }
                }
                .padding(.bottom, 8 * .deviceFontScale)
                .scrollIndicators(.hidden)
                
                VStack {
                    ForEach(viewModel.prioritiesTasks, id: \.self) { task in
                        TaskCard(
                            imageName: task.imageName,
                            title: task.title,
                            day: task.day,
                            start: task.start,
                            end: task.end,
                            isChecked: false
                        )
                    }
                }
                
                HeaderView(name: "My projects", seeAll: "See All")
                ProjectCell(
                    name: "cubes",
                    title: "To Do List",
                    subtitle: "3 tasks",
                    colorCircle: .darkGreen,
                    backgroundColor: .lightGreen
                )
                ProjectCell(
                    name: "bag",
                    title: "Some Purchases",
                    subtitle: "5 tasks",
                    colorCircle: .white,
                    backgroundColor: .lightPink
                )
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
    
}

