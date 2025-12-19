//
//  AllTasksView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI

struct AllTasksView<VM: AllTasksViewModelType>: View {
   // MARK: - Properties
    @StateObject var viewModel: VM

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                headerView()
                Spacer()
            }
            
            VStack {
                Spacer()
                VStack {
                    priorityTasksView()
                    scheduleTasksView()
                    Spacer()
                }
                .frame(width: .screenWidth, height: .screenHeight * 0.68)
                .background(Color.white)
                .cornerRadius(44, corner: [.topLeft, .topRight])
            }
        }
        .padding(.horizontal, 20)
        .ignoresSafeArea()
    }
}
// MARK: - SubViews
//
extension AllTasksView {
    func headerView() -> some View {
        ZStack {
            VStack {
                CustomNavBar(showBackIcon: false,
                             onTappedNotification: viewModel.didTapNotification)
                    .foregroundStyle(.white)
                    .padding(.top, .topInsets)
                    .padding(.bottom, 12 * .deviceFontScale)

                HeaderView(name: Date.now.toString(), seeAll: "")
                    .foregroundStyle(.white)

                ScrollView(.horizontal) {
                    HStack(spacing: 24 * .deviceFontScale) {
                        ForEach(viewModel.days, id: \.self) { item in
                            CalenderCard(
                                title: item.day,
                                number: item.number,
                                progress: item.progress,
                                textColor: .white,
                                forGroundColor: .white
                            )
                        }
                    }
                    .padding([.vertical], 8 * .deviceFontScale)
                }
                .scrollIndicators(.hidden)
                .padding(.bottom, 24 * .deviceFontScale)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .frame(width: .screenWidth, height: .screenHeight * 0.38)
        .background(Color.darkPrimaryApp)
    }

    func priorityTasksView() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(
                    Array(viewModel.prioritieItems.enumerated()),
                    id: \.offset
                ) { index, priority in
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
        .padding([.top], 28 * .deviceFontScale)
        .padding([.bottom], 12 * .deviceFontScale)
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }

    func scheduleTasksView() -> some View {
        List {
            Section {
                HeaderView(name: "Schedule", seeAll: "")
                    .listRowInsets(EdgeInsets())    /// remove padding
                    .listRowSeparator(.hidden)

                ForEach(viewModel.prioritiesTasks.indices, id: \.self) { index in
                    let task = viewModel.prioritiesTasks[index]

                    TaskCard(
                        taskCardModel: .init(
                            title: task.title,
                            subTitle: task.subTitle,
                            day: task.day,
                            start: task.start,
                            end: task.end,
                            imageName: task.imageName,
                            colorSubTitle: Color.LightGray,
                            colorCircle: Color.lightBeige,
                            backgroundColor: Color.lightPink
                        ),
                        onDelete: { viewModel.deleteTask(at: index) }
                    )
                    .onTapGesture { viewModel.didTapScheduleTask(task) }
                }
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
        .padding(.bottom, .bottomInsets + 40)
    }
}
