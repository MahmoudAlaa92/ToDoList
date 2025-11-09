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
                HomeNavBar(onTappedNotification: {
                    coordinator?.pushToHomeTab(.notification)
                })
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
private extension HomeView {
    
    @ViewBuilder
    func calenderSection() -> some View {
        HeaderView(name: "Calender", seeAll: "")
        
        ScrollView(.horizontal) {
            HStack(spacing: 24 * .deviceFontScale) {
                ForEach(viewModel.days, id: \.self) { item in
                    CalenderCard(title: item.day,
                                 number: item.number,
                                 progress: item.progress)
                }
            }
            .padding([.horizontal, .vertical], 8 * .deviceFontScale)
        }
        .padding(.bottom, 24 * .deviceFontScale)
    }
    
    @ViewBuilder
    func toDaysTasksSection() -> some View {
        HeaderView(name: "To day’s tasks")
        
        ForEach(viewModel.todaysTask, id: \.title) { task in
            TaskCard(imageName: task.imageName, title: task.title)
                .onTapGesture { onTappedTodaysTask(task: task)}
        }
    }
    
    @ViewBuilder
    func myProjectsSection() -> some View {
        HeaderView(name: "My Projects")
        
        ForEach(viewModel.projectCells, id: \.name) { cell in
            ProjectCell(name: cell.name, title: cell.title, subtitle: cell.subtitle,
                        colorCircle: cell.colorCircle, backgroundColor: cell.backgroundColor)
        }
    }
}
// MARK: - Actions
//
private extension HomeView {
    func onTappedTodaysTask(task: TaskCard) {
        
    }
}
// MARK: - Preview
//
#Preview {
    HomeView(viewModel: HomeViewModel())
}
