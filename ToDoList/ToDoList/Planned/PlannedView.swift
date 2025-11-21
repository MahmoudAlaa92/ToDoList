//
//  PlannedView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct PlannedView: View {
    
    @State var PlannedVM: PlannedViewModel
    weak var coordinator: AppCoordinator?

    var body: some View {
        ZStack {
            VStack {
                CustomNavBar(showBackIcon: false,
                             onTappedNotification: onTappedNotification)
                VStack {
                    ForEach(PlannedVM.plannedCompleted.enumerated(), id: \.offset) { (index,task) in
                        TaskCard(taskCardModel: task)
                            .onTapGesture { onTappedTaskCard(taskCard: task) }
                    }
                }
                .padding(.vertical, 14)
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}
// MARK: - Actions
//
extension PlannedView {
    private func onTappedNotification() {
        coordinator?.pushNotification(for: .planned)
    }
    
    private func onTappedTaskCard(taskCard: PlannedModel) {
        coordinator?.pushProjectDetails(for: .planned, taskCard: taskCard)
    }
}
