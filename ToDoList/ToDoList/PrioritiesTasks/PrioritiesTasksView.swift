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
                CustomNavBar(showBackIcon: false,
                             onTappedNotification: onTappedNotification)
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
                            .onTapGesture { onTappedTaskCard(taskCard: task) }
                    }
                }
                
                HeaderView(name: "My projects", seeAll: "See All")
                ProjectCell(projectItem: .init(
                    title: "To Do List",
                    subTitle: "3 tasks",
                    day: "Mondat",
                    start: "10:00pm",
                    end: "11:00pm",
                    imageName: "cubes",
                    colorSubTitle: .darkGray,
                    colorCircle: .white,
                    backgroundColor: .lightGreen
                ))
                ProjectCell(projectItem: .init(
                    title: "bag",
                    subTitle: "5 tasks",
                    day: "Friday",
                    start: "10:00pm",
                    end: "11:00pm",
                    imageName: "bag",
                    colorSubTitle: .darkGray,
                    colorCircle: .darkPrimaryApp,
                    backgroundColor: .lightPink)
                )
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
    
}
// MARK: - Actions
//
extension PrioritiesTasksView {
    private func onTappedNotification() {
        coordinator?.pushNotification(for: .prioritiesTask)
    }
    
    private func onTappedTaskCard(taskCard: PlannedModel) {
        coordinator?.pushProjectDetails(for: .prioritiesTask, taskCard: taskCard)
    }
}
