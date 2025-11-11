//
//  Home.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel
    weak var coordinator: AppCoordinator?

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
        HeaderView(name: "To day’s tasks")

        ForEach(viewModel.todaysTask.enumerated(), id: \.offset) {
            (index, item) in
            TaskCard(taskCardModel: item)
                .onTapGesture { onTappedTodaysTask(task: item) }
        }
    }

    @ViewBuilder
    fileprivate func myProjectsSection() -> some View {
        HeaderView(name: "My Projects")
        
        ForEach(viewModel.projectCells.enumerated(), id: \.offset) { (index, item) in
            ProjectCell(projectItem: item.projectItem)
        }
    }
}
// MARK: - Actions
//
extension HomeView {
    fileprivate func onTappedTodaysTask(task: PlannedModel) {
        coordinator?.pushToHomeTab(.projectDetails(taskCard: task))
    }
    
    fileprivate func onTappedNotification() {
        coordinator?.pushToHomeTab(.notification)
    }
}
// MARK: - Preview
//
#Preview {
    HomeView(viewModel: HomeViewModel())
}
