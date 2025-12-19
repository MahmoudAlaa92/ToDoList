//
//  CommentsDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Foundation

protocol CommentsDataProviderProtocol {
    func fetchComments() -> [CommentsModel]
}

final class CommentsDataProvider: CommentsDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = CommentsDataProvider()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Fetch Methods
    func fetchComments() -> [CommentsModel] {
        return [
            .init(
                name: "Mahmoud Alaa",
                imageName: "ProfilePicture",
                comment: "I think this is good",
                time: "5 min"
            ),
            .init(
                name: "Sara Ahmed",
                imageName: "ProfilePicture2",
                comment: "I think this is good",
                time: "8 min"
            ),
            .init(
                name: "Hossam Alaa",
                imageName: "ProfilePicture3",
                comment: "I think this is good",
                time: "10 min"
            ),
        ]
    }
}
// MARK: - Mock Data Provider (For Testing)
//
final class MockCommentsDataProvider: CommentsDataProviderProtocol {
    func fetchComments() -> [CommentsModel] {
        return [
            .init(
                name: "Mahmoud Alaa",
                imageName: "ProfilePicture",
                comment: "I think this is good",
                time: "5 min"
            )
        ]
    }
}
