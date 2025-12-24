//
//  CreatedTaskView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct CreatedTaskView<VM: CreatedTaskViewModelType>: View {
    
    // MARK: - Properties
    @StateObject var viewModel: VM
    
    // MARK: - Init
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                navigationBar()
                taskDetailsSection()
                addProjectSection()
                descriptionSection()
                assignPersonsSection()
                tasksListSection()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}
// MARK: - SubViews
//
extension CreatedTaskView {
    func navigationBar() -> some View {
        CustomNavBar(
            showSearchIcon: false,
            onTappedBack: { viewModel.didTapBack() },
            onTappedNotification: { viewModel.didTapNotification() }
        )
    }
    
    func taskDetailsSection() -> some View {
        TaskDetails(taskItems: viewModel.taskItem)
    }
    
    func addProjectSection() -> some View {
        HStack {
            Spacer()
            AddProject(
                title:  L10n.Projects.addProject,
                backGround: Color.primaryApp
            )
            .onTapGesture {
                viewModel.didTapAddProject()
            }
        }
    }
    
    func descriptionSection() -> some View {
        DescriptionRow()
    }
    
    func assignPersonsSection() -> some View {
        AssignPersons(persons: viewModel.assignedPersons)
    }
    
    func tasksListSection() -> some View {
        VStack(alignment: .leading) {
            HeaderView(name: L10n.Tasks.ourTasks, seeAll: "")
            
            List {
                ForEach(viewModel.plannedTasks.indices, id: \.self) { index in
                    let task = viewModel.plannedTasks[index]
                    
                    TaskCard(
                        taskCardModel: task,
                        onDelete: { viewModel.deleteTask(at: index) }
                    )
                }
            }
            .listStyle(.plain)
            .scrollDisabled(true)
            .frame(height: CGFloat(viewModel.plannedTasks.count) * 150 * .deviceFontScale)
        }
    }
}
// MARK: - Preview
//
#Preview {
    let taskItem = PlannedModel(
        title: L10n.Projects.toDoList,
        subTitle: L10n.Tasks.redesignApp,
        day: L10n.Tasks.friday,
        start: "11:00\(L10n.Time.pm)",
        end: "01:00\(L10n.Time.am)",
        imageName: "cubes",
        colorSubTitle: Color.LightGray,
        colorCircle: nil,
        backgroundColor: Color.darkPrimaryApp
    )
    
    let viewModel = CreatedTaskViewModel(
        taskItem: taskItem,
        sourceTab: .home,
        dataProvider: CreatedTaskDataProvider.shared
    )
    
    CreatedTaskView(viewModel: viewModel)
}
