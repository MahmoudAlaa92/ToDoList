//
//  AddTask.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI
import Combine

struct AddTask: View {

    @State var changeTaskName: String = ""
    @State var changeTaskTitle: String = ""
    @State var changeTaskSubTitle: String = ""
    @State var changeTaskDescription: String = ""
    @StateObject var viewModel: AddTaskViewModel
    weak var coordinator: CoordinatorProtocol?
    
    @State private var showAlert = false
    @State private var alertTitle = ""

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
        .onChange(of: changeTaskName) { _, newValue in
            viewModel.updateTaskName(newValue)
        }
        .onChange(of: changeTaskTitle) { _, newValue in
            viewModel.updateTaskTitle(newValue)
        }
        .onChange(of: changeTaskSubTitle) { _, newValue in
            viewModel.updateTaskSubTitle(newValue)
        }
        .onChange(of: changeTaskDescription) { _, newValue in
            viewModel.updateTaskDescription(newValue)
        }
        .onReceive(viewModel.createdSuccess) { message in
            alertTitle = message
            showAlert = true
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
            text: $changeTaskName
        )
        CustomTextField(
            title: "Title",
            placeholder: "Enter your title",
            text: $changeTaskTitle
        )
        CustomTextField(
            title: "SubTitle",
            placeholder: "Enter your subTitle",
            text: $changeTaskSubTitle
        )
        CustomTextField(
            title: "Description",
            placeholder: "Add Description..",
            height: 100 * .deviceFontScale,
            text: $changeTaskDescription
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
