//
//  PlannedView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct PlannedView: View {
    
    @State var PlannedVM: PlannedViewModel
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavBar()
                VStack {
                    ForEach(PlannedVM.plannedCompleted, id: \.self) { task in
                        TaskCard(imageName: task.imageName,
                                 title: task.title,
                                 showStrikeLine: true,
                                 day: task.day,
                                 start: task.start,
                                 end: task.end,
                                 isChecked: true)
                    }
                }
                .padding(.vertical, 14)
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PlannedView(PlannedVM: PlannedViewModel())
}
