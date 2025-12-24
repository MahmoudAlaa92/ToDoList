//
//  ProjectDetailsViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine
import SwiftUI
import Foundation

@MainActor
final class ProjectDetailsViewModel: ProjectDetailsViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: ProjectDetailsDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    let taskCard: PlannedModel
    let sourceTab: Tabs
    @Published var assignedPersons: [Image]
    @Published var comment: String = ""
    @Published var isSubmittingComment: Bool = false
    
    // MARK: - Private Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(
        taskCard: PlannedModel,
        sourceTab: Tabs,
        coordinator: CoordinatorProtocol,
        dataProvider: ProjectDetailsDataProviderProtocol
    ) {
        self.taskCard = taskCard
        self.sourceTab = sourceTab
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        // Fetch assigned persons
        self.assignedPersons = dataProvider.fetchAssignedPersons(for: nil)
    }
}
// MARK: - Input Methods
//
extension ProjectDetailsViewModel {
    func didTapBack() {
        coordinator?.goBack(from: sourceTab)
    }
    
    func didTapNotification() {
        coordinator?.pushNotification(for: sourceTab)
    }
    
    func updateComment(_ comment: String) {
        self.comment = comment
    }
    
    func submitComment() {
        guard !comment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Comment is empty")
            return
        }
        
        isSubmittingComment = true
        
        Task { @MainActor in
            do {
                let success = try await dataProvider.submitComment(comment, for: taskCard.title)
                
                if success {
                    print("Comment submitted successfully")
                    // Clear comment after successful submission
                    comment = ""
                }
            } catch {
                print("Failed to submit comment: \(error.localizedDescription)")
            }
            
            isSubmittingComment = false
        }
    }
    
    func didTapAssignedPerson(_ person: String) {
        // Navigate to person profile or show person details
        print("Tapped person: \(person)")
        // coordinator?.pushPersonProfile(person)
    }
}
// MARK: - Private Methods
//
private extension ProjectDetailsViewModel {
    func validateComment() -> Bool {
        return !comment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func refreshAssignedPersons() {
        assignedPersons = dataProvider.fetchAssignedPersons(for: taskCard.title)
    }
}
