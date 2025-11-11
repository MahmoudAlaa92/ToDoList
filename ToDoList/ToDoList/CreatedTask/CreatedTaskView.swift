//
//  CreatedTaskView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct CreatedTaskView: View {
    
    var viewModel: CreatedTaskViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                CustomNavBar(showSearchIcon: false)
                TaskDetails(taskName: "cubes",
                            title: "To Do List",
                            subTitle: "Redesign",
                            day: "31Auguist,24",
                            from: "11am",
                            to: "9pm")
                HStack {
                    Spacer()
                    AddProject(title: "Add project", backGround: Color.primaryApp)
                }
                DescriptionRow()
                AssignPersons(persons: ["woman" , "teenagerGirl", "youngSmilingMan"])
                HeaderView(name: "Our Tasks for the project", seeAll: "")
                
                ForEach(viewModel.plannedCompleted.enumerated(), id: \.offset) { (index,task) in
                    TaskCard(taskCardModel: task)
                }
                
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CreatedTaskView(viewModel: CreatedTaskViewModel())
}
