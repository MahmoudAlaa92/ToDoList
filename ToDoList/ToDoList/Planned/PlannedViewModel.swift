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
        .init(
            title: "Client Review &Feedback",
            subTitle: "Redesign App",
            day: "Today",
            start: "10:00 am",
            end: "4:00 pm",
            imageName: "Mobile trading",
            colorSubTitle: Color.LightGray,
            colorCircle: Color.lightBeige,
            backgroundColor: Color.lightPink
        ),
        .init(
            title: "Client Review",
            subTitle: "Redesign App",
            day: "Today",
            start: "10:00 am",
            end: "4:00 pm",
            imageName: "cubes",
            colorSubTitle: Color.LightGray,
            colorCircle: Color.lightBeige,
            backgroundColor: Color.lightPink
        )
    ]
    
    func deleteItems(at index: Int) {
        plannedCompleted.remove(at: index)
    }
}
