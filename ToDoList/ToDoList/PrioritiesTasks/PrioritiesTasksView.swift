//
//  PrioritiesTasksView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct PrioritiesTasksView<ViewModel: PrioritiesTasksViewModelType>: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                navigationBar()
                todaysTaskHeader()
                priorityFilterSection()
                priorityTasksList()
                myProjectsSection()
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - SubViews
extension PrioritiesTasksView {
    func navigationBar() -> some View {
        CustomNavBar(
            showBackIcon: false,
            onTappedNotification: { viewModel.didTapNotification() }
        )
    }
    
    func todaysTaskHeader() -> some View {
        HeaderView(
            name: "Today's Task",
            seeAll: "See All"
        )
    }
    
    func priorityFilterSection() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(Array(viewModel.priorityItems.enumerated()), id: \.offset) { index, priority in
                    PriorityCircle(
                        title: priority.title,
                        number: priority.number,
                        isSelected: viewModel.selectedPriorityIndex == index
                    ) {
                        viewModel.selectPriority(at: index)
                    }
                }
            }
        }
        .padding(.bottom, 8 * .deviceFontScale)
        .scrollIndicators(.hidden)
    }
    
    func priorityTasksList() -> some View {
        List {
            ForEach(viewModel.priorityTasks.indices, id: \.self) { index in
                let task = viewModel.priorityTasks[index]
                
                TaskCard(
                    taskCardModel: task,
                    onDelete: { viewModel.deleteTask(at: index) }
                )
                .onTapGesture {
                    viewModel.didTapTaskCard(task)
                }
            }
        }
        .listStyle(.plain)
        .scrollDisabled(true)
        .frame(height: CGFloat(viewModel.priorityTasks.count) * 150 * .deviceFontScale)
    }
    
    func myProjectsSection() -> some View {
        VStack {
            HeaderView(name: "My projects",
                       seeAll: "See All") { viewModel.didTapSeeAllProjects() }
            
            ForEach(viewModel.projectItems.enumerated(), id: \.offset) { (index, item) in
                ProjectCell(projectItem: viewModel.projectItems[index])
                    .onTapGesture { viewModel.didTapProjetCell(item: item) }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    let dataProvider = PrioritiesTasksDataProvider.shared
    let coordinator = AppCoordinator(taskStore: TaskStore())
    let viewModel = PrioritiesTasksViewModel(sourceTab: .prioritiesTask, coordinator: coordinator,
                                             dataProvider: dataProvider)
    PrioritiesTasksView(viewModel: viewModel)
}
