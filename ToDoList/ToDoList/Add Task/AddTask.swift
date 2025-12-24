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
            alertTitle = L10n.Tasks.createdTaskSuccessfully
            showAlert = true
        }
        .onReceive(viewModel.error) { error in
            alertTitle = error
            showAlert = true
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button(L10n.General.ok, role: .cancel) {}
        }
    }
}
// MARK: - Subviews
//
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
                 title: L10n.AddTask.taskName,
                 placeholder: L10n.AddTask.enterTaskName,
                 text: $viewModel.taskName
             )

             CustomTextField(
                 title: L10n.AddTask.taskTitle,
                 placeholder: L10n.AddTask.enterTaskTitle,
                 text: $viewModel.taskTitle
             )

             CustomTextField(
                 title: L10n.AddTask.taskSubtitle,
                 placeholder: L10n.AddTask.enterTaskSubtitle,
                 text: $viewModel.taskSubTitle
             )

             CustomTextField(
                 title: L10n.AddTask.taskDescription,
                 placeholder: L10n.AddTask.enterDescription,
                 height: 100 * .deviceFontScale,
                 text: $viewModel.taskDescription
             )
         }
     }

    func addSubTask() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                AddProject(
                    title: L10n.AddTask.addSubtask,
                    titleColor: .primaryApp,
                    backGround: .white,
                    plusCircleColor: .darkGray
                ) {}
                Spacer()
            }
            AssignPersons(persons: [Images.profilePicture, Images.profilePicture2])
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
        PrimaryButton(title: L10n.AddTask.createTask) {
            viewModel.createTaskTapped()
        }
        .disabled(!viewModel.isFormValid)
        .opacity(viewModel.isFormValid ? 1 : 0.6)
        .padding(.vertical, 16)
    }
}
