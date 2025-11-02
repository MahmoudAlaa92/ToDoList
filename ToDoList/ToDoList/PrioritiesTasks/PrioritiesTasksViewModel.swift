//
//  PrioritiesTasksViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import Foundation
import Combine

class PrioritiesTasksViewModel: ObservableObject {
    
    @Published var prioritieItems: [PriorityModel] = [
        .init(title: "All", number: 10),
        .init(title: "High Priority", number: 4),
        .init(title: "Medium Priority", number: 6),
        .init(title: "Low Priority", number: 8),
        .init(title: "Not Priority", number: 8)
    ]
        
    @Published var prioritiesTasks: [PlannedModel] = [
        .init(title: "Client Review &Feedback", subTitle: "Redesign App", day: "Today", start: "10:00 am", end: "4:00 pm", imageName: "Mobile trading"),
        .init(title: "Client Review", subTitle: "Redesign App", day: "Today", start: "10:00 am", end: "4:00 pm", imageName: "cubes")
    ]
}
