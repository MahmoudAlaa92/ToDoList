//
//  CommentsViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

protocol CommentsViewModelType: ObservableObject {
    
    // MARK: - Output
    var commentItems: [CommentsModel] { get }
}
