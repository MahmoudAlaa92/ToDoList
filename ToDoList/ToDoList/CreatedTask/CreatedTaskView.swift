//
//  CreatedTaskView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct CreatedTaskView: View {
    
    @StateObject var viewModel: CreatedTaskViewModel
    var taskItem: PlannedModel
    weak var coordinator: CoordinatorProtocol?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                CustomNavBar(showSearchIcon: false,
                             onTappedBack: onTappedBackButton)
                TaskDetails(taskItems: taskItem)
                HStack {
                    Spacer()
                    AddProject(
                        title: "Add project",
                        backGround: Color.primaryApp
                    )
                }
                DescriptionRow()
                AssignPersons(persons: [
                    "woman", "teenagerGirl", "youngSmilingMan",
                ])
                HeaderView(name: "Our Tasks for the project", seeAll: "")
                
                ForEach(viewModel.plannedCompleted.enumerated(), id: \.offset) {
                    (index, task) in
                    TaskCard(taskCardModel: task)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

// MARK: - Actions
//
extension CreatedTaskView {
    private func onTappedBackButton() {
        coordinator?.goBack(from: .home)
        print("Yes")
    }
}

#Preview {
    CreatedTaskView(
        viewModel: CreatedTaskViewModel(),
        taskItem: PlannedModel(
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
    )
}
