//
//  CommentsViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Foundation
import Combine

class CommentsViewModel: ObservableObject {
    @Published var commentItems: [CommentsModel] = [
        .init(name: "Mahmoud Alaa", imageName: "ProfilePicture", comment: "I think this is good", time: "5 min"),
        .init(name: "Sara Ahmed", imageName: "ProfilePicture2", comment: "I think this is good", time: "8 min"),
        .init(name: "Hossam Alaa", imageName: "ProfilePicture3", comment: "I think this is good", time: "10 min"),
    ]
}
