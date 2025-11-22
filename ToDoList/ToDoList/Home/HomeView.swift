//
//  Home.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel
    weak var coordinator: CoordinatorProtocol?

    var body: some View {
        ZStack {
            VStack {
                HomeNavBar(onTappedNotification: { onTappedNotification() })
                ScrollView {
                    calenderSection()
                    AnnouncementCard()
                    toDaysTasksSection()
                    myProjectsSection()
                    Spacer()
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding(.horizontal, 20)
    }
}
// MARK: - Views
//
extension HomeView {

    @ViewBuilder
    fileprivate func calenderSection() -> some View {
        HeaderView(name: "Calender", seeAll: "")

        ScrollView(.horizontal) {
            HStack(spacing: 24 * .deviceFontScale) {
                ForEach(viewModel.days, id: \.self) { item in
                    CalenderCard(
                        title: item.day,
                        number: item.number,
                        progress: item.progress
                    )
                }
            }
            .padding([.horizontal, .vertical], 8 * .deviceFontScale)
        }
        .padding(.bottom, 24 * .deviceFontScale)
    }

    @ViewBuilder
    fileprivate func toDaysTasksSection() -> some View {
        HeaderView(name: "To day's tasks")
        
        List {
            ForEach(Array(viewModel.todaysTask.enumerated()), id: \.offset) { index, item in
                TaskCard(taskCardModel: item,
                         onDelete: { viewModel.deleteItems(at: index) })
                
                    .onTapGesture { onTappedTodaysTask(task: item) }
            }
        }
        .listStyle(.plain)
        .scrollDisabled(true)
        .frame(height: CGFloat(viewModel.todaysTask.count) * 150 * .deviceFontScale)
    }

    @ViewBuilder
    fileprivate func myProjectsSection() -> some View {
        HeaderView(name: "My Projects")
        
        ForEach(viewModel.projectCells.enumerated(), id: \.offset) { (index, item) in
            ProjectCell(projectItem: item)
                .onTapGesture { onTappedProject(task: item) }
        }
    }
}
// MARK: - Actions
//
extension HomeView {
    fileprivate func onTappedTodaysTask(task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .home, taskCard: task)
    }
    
    fileprivate func onTappedNotification() {
        coordinator?.pushNotification(for: .home)
    }
    
    fileprivate func onTappedProject(task: PlannedModel) {
        coordinator?.pushCreatedTaskView(for: .home, taskCard: task)
    }
}
// MARK: - Preview
//
#Preview {
    HomeView(viewModel: HomeViewModel())
}
