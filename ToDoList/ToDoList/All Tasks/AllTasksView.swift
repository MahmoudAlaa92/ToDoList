//
//  AllTasksView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI

struct AllTasksView: View {

    @State var viewModel: AllTasksViewModel
    @State var selectedIndex: Int?
    weak var coordinator: AppCoordinator?

    var body: some View {
        ZStack {
            VStack {
                headerView()
                Spacer()
            }
            VStack {
                Spacer()
                VStack {
                    ProiritieTask()
                    scheduleTasks()
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
// MARK: - Views
//
extension AllTasksView {
    func headerView() -> some View {
        ZStack {
            VStack {
                CustomNavBar(showBackIcon: false)
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

    func ProiritieTask() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(
                    Array(viewModel.prioritieItems.enumerated()),
                    id: \.offset
                ) { index, priority in
                    PriorityCircle(
                        title: priority.title,
                        number: priority.number,
                        isSelected: selectedIndex == index
                    ) {
                        selectedIndex = (selectedIndex == index ? nil : index)
                    }
                }
            }
        }
        .padding([.bottom, .top], 28 * .deviceFontScale)
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }

    func scheduleTasks() -> some View {
        ScrollView(.vertical) {
            VStack {
                HeaderView(name: "Schedule", seeAll: "")
                VStack {
                    ForEach(viewModel.prioritiesTasks, id: \.self) { task in
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
                            )
                        ).onTapGesture { onTappedScheduleTask(task: task) }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}
// MARK: - Actions
//
extension AllTasksView {
    fileprivate func onTappedScheduleTask(task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .today, taskCard: task)
    }
}
