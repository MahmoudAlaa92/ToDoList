//
//  CommentsViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Combine

class CommentsViewModel: CommentsViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: CommentsDataProviderProtocol
    
    // MARK: - Properties
    @Published var commentItems: [CommentsModel] = []
    
    // MARK: - Init
    init(dataProvider: CommentsDataProviderProtocol) {
        self.dataProvider = dataProvider
        self.commentItems = dataProvider.fetchComments()
    }
}
