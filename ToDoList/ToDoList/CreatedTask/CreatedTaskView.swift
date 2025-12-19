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
                title: "Add project",
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
            HeaderView(name: "Our Tasks for the project", seeAll: "")
            
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
        title: "To Do List",
        subTitle: "Redesign",
        day: "Friday",
        start: "11:00pm",
        end: "01:00am",
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
