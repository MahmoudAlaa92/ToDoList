//
//  PlannedView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct PlannedView<ViewModel: PlannedViewModelType>: View {

    // MARK: - Properties
    @StateObject var viewModel: ViewModel

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                navigationBar()
                tasksList()
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - SubViews
extension PlannedView {
    func navigationBar() -> some View {
        CustomNavBar(
            showBackIcon: false,
            onTappedSearch: { viewModel.didTapSearch() },
            onTappedNotification: { viewModel.didTapNotification() }
        )
    }

    func tasksList() -> some View {
        List {
            ForEach(viewModel.plannedTasks.indices, id: \.self) { index in
                let task = viewModel.plannedTasks[index]

                TaskCard(
                    taskCardModel: task,
                    onDelete: { viewModel.deleteTask(at: index) }
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.didTapTaskCard(task)
                }
            }
        }
        .listStyle(.plain)
        .padding(.vertical, 14)
        .refreshable {
            viewModel.refreshTasks()
        }
    }
}

// MARK: - Preview
#Preview {
    let coordinator = AppCoordinator(taskStore: TaskStore())
    let dataProvider = PlannedDataProvider.shared
    
    return PlannedView(
        viewModel: PlannedViewModel(
            coordinator: coordinator,
            dataProvider: dataProvider
        )
    )
}
