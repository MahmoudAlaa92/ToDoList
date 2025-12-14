//
//  AddTask.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI
import Combine

struct AddTask: View {

    // MARK: - Properties
    @EnvironmentObject var taskStore: TaskStore
    @StateObject var viewModel: AddTaskViewModel
    weak var coordinator: CoordinatorProtocol?
    
    @State private var showAlert = false
    @State private var alertTitle = ""

   // MARK: - Init
    init(coordinator: CoordinatorProtocol? ,taskStore: TaskStore) {
        self.coordinator = coordinator
        _viewModel = StateObject(wrappedValue: AddTaskViewModel(taskStore: taskStore))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                CustomNavBar(
                    showSearchIcon: false,
                    showBackIcon: false,
                    onTappedNotification: {
                        coordinator?.pushNotification(for: .addTask)
                    }
                )
                textFields()
                addSubTask()
                taskActionBar()
                creatTaskButton()
            }
        }
        .padding(.horizontal, 20)
        .scrollIndicators(.hidden)
        .onChange(of: viewModel.taskName) { _, newValue in
            viewModel.updateTaskName(newValue)
        }
        .onChange(of: viewModel.taskTitle) { _, newValue in
            viewModel.updateTaskTitle(newValue)
        }
        .onChange(of: viewModel.taskSubTitle) { _, newValue in
            viewModel.updateTaskSubTitle(newValue)
        }
        .onChange(of: viewModel.taskDescription) { _, newValue in
            viewModel.updateTaskDescription(newValue)
        }
        .onReceive(viewModel.createdSuccess) { task in
            alertTitle = "Task Created Successfuly"
            showAlert = true
            taskStore.addTask(task)
        }
        .onReceive(viewModel.createdError) { error in
            alertTitle = error
            showAlert = true
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
        
        Spacer()
    }
}
// MARK: - Views
//
extension AddTask {
    @ViewBuilder
    func textFields() -> some View {

        CustomTextField(
            title: "Add Your Project Name",
            placeholder: "Enter your Project Name",
            text: $viewModel.taskName
        )
        CustomTextField(
            title: "Title",
            placeholder: "Enter your title",
            text: $viewModel.taskTitle
        )
        CustomTextField(
            title: "SubTitle",
            placeholder: "Enter your subTitle",
            text: $viewModel.taskSubTitle
        )
        CustomTextField(
            title: "Description",
            placeholder: "Add Description..",
            height: 100 * .deviceFontScale,
            text: $viewModel.taskDescription
        )
    }
}
// MARK: - Actions
//
extension AddTask {
    func addSubTask() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                AddProject(
                    title: "Add SubTak",
                    titleColor: .primaryApp,
                    backGround: .white,
                    plusCircleColor: .darkGray
                ) {}
                Spacer()
            }
            AssignPersons(persons: ["ProfilePicture", "ProfilePicture2"])
        }
    }

    func taskActionBar() -> some View {
        TaskActionBar(
            onCalendarTap: {},
            onAlertTap: { coordinator?.presentSheet(.selectTime) },
            onFlagTap: {},
            onPhotoTap: {},
            onMicTap: {},
            onPlusTap: {}
        )
    }

    func creatTaskButton() -> some View {
        PrimaryButton(
            title: "Creat Task",
            action: {
                viewModel.createdTaskTapped()
            }
        )
        .padding(.vertical, 16)
    }
}
