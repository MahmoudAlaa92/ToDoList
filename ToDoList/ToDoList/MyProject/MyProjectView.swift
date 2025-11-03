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
                    ProjectCell(name: cellItem.name,
                                title: cellItem.title,
                                subtitle: cellItem.subTitle,
                                colorCircle: index % 2 == 0 ? .white : .darkPrimaryApp,
                                backgroundColor: index % 2 != 0 ? .lightGreen : .lightPink)
                }
              
             
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Spacer()
                    AddProject {}
                }
            }
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MyProjectView(viewModel: MyProjectViewModel())
}
