//
//  PlannedViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI
import Combine

class PlannedViewModel: ObservableObject {
    @Published var plannedCompleted: [PlannedModel] = [
        .init(title: "Client Review &Feedback", subTitle: "Redesign App", day: "Today", start: "10:00 am", end: "4:00 pm", imageName: "Mobile trading"),
        .init(title: "Client Review", subTitle: "Redesign App", day: "Today", start: "10:00 am", end: "4:00 pm", imageName: "cubes")
    ]
}
