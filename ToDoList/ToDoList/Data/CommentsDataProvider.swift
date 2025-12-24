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
                name: L10n.Notifications.mahmoudAlaa,
                imageName: "ProfilePicture",
                comment: L10n.Comments.iThinkGood,
                time: L10n.Comments.TimeAgo.min(5)
            ),
            .init(
                name: L10n.Notifications.sarahSamy,
                imageName: "ProfilePicture2",
                comment: L10n.Comments.iThinkGood,
                time: L10n.Comments.TimeAgo.min(8)
            ),
            .init(
                name: L10n.Notifications.hossamAlaa,
                imageName: "ProfilePicture3",
                comment: L10n.Comments.iThinkGood,
                time: L10n.Comments.TimeAgo.min(10)
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
                name: L10n.Notifications.mahmoudAlaa,
                imageName: "ProfilePicture",
                comment: L10n.Comments.iThinkGood,
                time: L10n.Comments.TimeAgo.min(5)
            )
        ]
    }
}
