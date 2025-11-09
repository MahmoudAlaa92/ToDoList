//
//  AddTask.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct AddTask: View {
    
    @State var changeTaskName: String = ""
    @State var changeTaskTitle: String = ""
    @State var changeTaskSubTitle: String = ""
    @State var changeTaskDescription: String = ""
    let coordinator: AppCoordinator

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                CustomNavBar(showSearchIcon: false)
                textFields()
                addSubTask()
                taskActionBar()
                creatTaskButton()
            }
        }
        .padding(.horizontal, 20)
        .scrollIndicators(.hidden)
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
            text: $changeTaskName)
        CustomTextField(
            title: "Title",
            placeholder: "Enter your title",
            text: $changeTaskTitle)
        CustomTextField(
            title: "SubTitle",
            placeholder: "Enter your subTitle",
            text: $changeTaskSubTitle)
        CustomTextField(
            title: "Description",
            placeholder: "Add Description..",
            height: 100 * .deviceFontScale,
            text: $changeTaskDescription)
    }
}
// MARK: - Actions
//
extension AddTask {
    func addSubTask() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                AddProject(title: "Add SubTak",
                           titleColor: .primaryApp,
                           backGround: .white,
                           plusCircleColor: .darkGray) {}
                Spacer()
            }
            AssignPersons(persons: ["ProfilePicture", "ProfilePicture2"])
        }
    }
    
    func taskActionBar() -> some View {
        TaskActionBar (
            onCalendarTap: {},
            onAlertTap: {},
            onFlagTap: {},
            onPhotoTap: {},
            onMicTap: {},
            onPlusTap: {}
        )
    }
    
    func creatTaskButton() -> some View {
        PrimaryButton(title: "Creat Task", action: {})
            .padding(.vertical, 16 )
    }
}
