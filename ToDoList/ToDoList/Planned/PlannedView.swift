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
                CustomNavBar()
                VStack {
                    ForEach(PlannedVM.plannedCompleted.enumerated(), id: \.offset) { (index,task) in
                        TaskCard(taskCardModel: task)
                    }
                }
                .padding(.vertical, 14)
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

