//
//  MyProjectViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Combine
import SwiftUI

final class MyProjectViewModel: MyProjectViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: MyProjectDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    let sourceTab: Tabs
    @Published var projectItems: [PlannedModel]
    
    // MARK: - Init
    init(
        sourceTab: Tabs,
        coordinator: CoordinatorProtocol?,
        dataProvider: MyProjectDataProviderProtocol
    ) {
        self.sourceTab = sourceTab
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        self.projectItems = dataProvider.fetchProjects()
    }
}

// MARK: - Input Methods
extension MyProjectViewModel {
    func didTapAddProject() {
        print("Add project tapped")
    }
    
    func didTapProject(_ project: PlannedModel) {
        coordinator?.pushProjectDetails(for: .home, taskCard: project)
    }
    
    func didTapBack() {
        coordinator?.goBack(from: sourceTab)
    }
    
    func didTapNotification() {
        coordinator?.pushNotification(for: sourceTab)
    }
    
    func didTapSearch() {
        print("Search tapped")
    }
}

// MARK: - Private Methods
private extension MyProjectViewModel {
    func refreshProjects() {
        projectItems = dataProvider.fetchProjects()
    }
    
    func addNewProject(_ project: PlannedModel) {
        projectItems.append(project)
    }
    
    func deleteProject(at index: Int) {
        guard index >= 0 && index < projectItems.count else { return }
        projectItems.remove(at: index)
    }
}
