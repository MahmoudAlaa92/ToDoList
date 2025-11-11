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
    weak var coordinator: AppCoordinator?

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
                        TaskCard(taskCardModel: task)
                         
                    }
                }
                
                HeaderView(name: "My projects", seeAll: "See All")
                ProjectCell(projectItem: .init(
                    name: "cubes",
                    title: "To Do List",
                    subtitle: "3 tasks",
                    colorSubTitle: .LightGray,
                    colorCircle: .darkGreen,
                    backgroundColor: .lightGreen
                ))
                ProjectCell(projectItem: .init(
                    name: "bag",
                    title: "Some Purchases",
                    subtitle: "5 tasks",
                    colorSubTitle: .LightGray,
                    colorCircle: .white,
                    backgroundColor: .lightPink)
                )
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
    
}

