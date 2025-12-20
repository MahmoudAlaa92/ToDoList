//
//  MyProjectView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct MyProjectView<ViewModel: MyProjectViewModelType>: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                navigationBar()
                projectsList()
                Spacer()
            }
            addProjectButton()
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 20)
    }
}

// MARK: - SubViews
extension MyProjectView {
    func navigationBar() -> some View {
        CustomNavBar(
            onTappedBack: { viewModel.didTapBack() },
            onTappedSearch: { viewModel.didTapSearch() },
            onTappedNotification: { viewModel.didTapNotification() }
        )
    }
    
    func projectsList() -> some View {
        ForEach(Array(viewModel.projectItems.enumerated()), id: \.offset) { (index, cellItem) in
            ProjectCell(projectItem: cellItem)
                .onTapGesture {
                    viewModel.didTapProject(cellItem)
                }
        }
    }
    
    func addProjectButton() -> some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Spacer()
                AddProject(
                    title: "Add Project",
                    backGround: Color.primaryApp
                ) {
                    viewModel.didTapAddProject()
                }
            }
        }
    }
}
// MARK: - Preview
//
#Preview {
    let dataProvider = MyProjectDataProvider.shared
    let coordinator = AppCoordinator(taskStore: TaskStore())
    let viewModel = MyProjectViewModel( sourceTab: .home, coordinator: coordinator, dataProvider: dataProvider)
    MyProjectView(viewModel: viewModel)
}
