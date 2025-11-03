//
//  CommentsView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct CommentsView: View {

    @State var viewModel: CommentsViewModel

    var body: some View {

        ZStack {
            
            VStack {
                BackAndTitleNavBar(title: "Comments")
                
                ForEach(viewModel.commentItems, id: \.self) { item in
                    CommentsRow(
                        imageName: item.imageName,
                        personName: item.name,
                        comment: item.comment,
                        time: item.time
                    )
                }
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CommentsView(viewModel: CommentsViewModel())
}
