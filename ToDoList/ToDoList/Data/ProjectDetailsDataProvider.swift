//
//  ProjectDetailsDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Foundation

// MARK: - Protocol
protocol ProjectDetailsDataProviderProtocol {
    func fetchAssignedPersons(for taskId: String?) -> [String]
    func submitComment(_ comment: String, for taskId: String?) async throws -> Bool
}

// MARK: - Implementation
final class ProjectDetailsDataProvider: ProjectDetailsDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = ProjectDetailsDataProvider()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Public Methods
    func fetchAssignedPersons(for taskId: String?) -> [String] {
        // In production, this would fetch based on taskId
        return ["ProfilePicture", "ProfilePicture2", "ProfilePicture3"]
    }
    
    func submitComment(_ comment: String, for taskId: String?) async throws -> Bool {
        // Simulate API call
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        
        // In production, this would make an actual API call
        print("Comment submitted for task \(taskId ?? "unknown"): \(comment)")
        
        return true
    }
}
