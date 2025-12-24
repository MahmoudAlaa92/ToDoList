//
//  ProjectDetailsViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine
import SwiftUI

// MARK: - Input Protocol
protocol ProjectDetailsViewModelInput: ObservableObject {
    func didTapBack()
    func didTapNotification()
    func updateComment(_ comment: String)
    func submitComment()
    func didTapAssignedPerson(_ person: String)
}

// MARK: - Output Protocol
protocol ProjectDetailsViewModelOutput: ObservableObject {
    var taskCard: PlannedModel { get }
    var assignedPersons: [Image] { get }
    var comment: String { get }
    var sourceTab: Tabs { get }
    var isSubmittingComment: Bool { get }
}

// MARK: - Protocol with Coordinator
protocol ProjectDetailsViewModelType: ProjectDetailsViewModelInput, ProjectDetailsViewModelOutput {
    var coordinator: CoordinatorProtocol? { get set }
}
