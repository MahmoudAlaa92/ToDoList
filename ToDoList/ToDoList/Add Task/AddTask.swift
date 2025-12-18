//
//  AddTask.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI
import Combine

struct AddTask<VM: AddTaskViewModelType>: View {

    // MARK: - Properties
    weak var coordinator: CoordinatorProtocol?
    @StateObject private var viewModel: VM

    @State private var showAlert = false
    @State private var alertTitle = ""

    // MARK: - Init
    init(
        coordinator: CoordinatorProtocol?,
        viewModel: VM
    ) {
        self.coordinator = coordinator
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                navBar()
                textFields()
                addSubTask()
                taskActionBar()
                createTaskButton()
            }
        }
        .padding(.horizontal, 20)
        .scrollIndicators(.hidden)
        .onReceive(viewModel.success) { _ in
            alertTitle = "Task Created Successfully"
            showAlert = true
        }
        .onReceive(viewModel.error) { error in
            alertTitle = error
            showAlert = true
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}
extension AddTask {

    func navBar() -> some View {
        CustomNavBar(
            showSearchIcon: false,
            showBackIcon: false,
            onTappedNotification: {
                coordinator?.pushNotification(for: .addTask)
            }
        )
    }

    func textFields() -> some View {
        VStack(spacing: 12) {
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

    func addSubTask() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                AddProject(
                    title: "Add SubTask",
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

    func createTaskButton() -> some View {
        PrimaryButton(title: "Create Task") {
            viewModel.createTaskTapped()
        }
        .disabled(!viewModel.isFormValid)
        .opacity(viewModel.isFormValid ? 1 : 0.6)
        .padding(.vertical, 16)
    }
}
