//
//  MyProjectView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct MyProjectView: View {
    
    @State var viewModel: MyProjectViewModel
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 16) {
               CustomNavBar()
                
                ForEach(Array(viewModel.projectItems.enumerated()), id: \.offset) { (index, cellItem) in
                    ProjectCell(projectItem: cellItem)
                }
             
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Spacer()
                    AddProject(title: "Add Project", backGround: Color.primaryApp) {}
                }
            }
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MyProjectView(viewModel: MyProjectViewModel())
}
