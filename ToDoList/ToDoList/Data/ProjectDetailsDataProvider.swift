//
//  ProjectDetailsDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

// MARK: - Protocol
protocol ProjectDetailsDataProviderProtocol {
    func fetchAssignedPersons(for taskId: String?) -> [Image]
    func submitComment(_ comment: String, for taskId: String?) async throws
        -> Bool
}

// MARK: - Implementation
final class ProjectDetailsDataProvider: ProjectDetailsDataProviderProtocol {

    // MARK: - Singleton
    static let shared = ProjectDetailsDataProvider()

    // MARK: - Init
    private init() {}

    // MARK: - Public Methods
    func fetchAssignedPersons(for taskId: String?) -> [Image] {
        // In production, this would fetch based on taskId
        return [
            Images.profilePicture,
            Images.profilePicture2,
            Images.profilePicture3,
        ]
    }

    func submitComment(_ comment: String, for taskId: String?) async throws
        -> Bool
    {
        // Simulate API call
        try await Task.sleep(nanoseconds: 1_000_000_000)  // 1 second delay

        // In production, this would make an actual API call
        print("Comment submitted for task \(taskId ?? "unknown"): \(comment)")

        return true
    }
}
