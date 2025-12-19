//
//  CommentsView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct CommentsView<VM: CommentsViewModelType>: View {

    // MARK: - Properteis
    @StateObject var viewModel: VM
    
    // MARK: - Init
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
            VStack {
                navigationBar
                commentsList
                Spacer()
            }
        .padding(.horizontal, 20)
    }
}
// MARK: - SubViews
//
private extension CommentsView {

    var navigationBar: some View {
        BackAndTitleNavBar(title: "Comments")
    }

    var commentsList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.commentItems, id: \.self) { item in
                    commentRow(for: item)
                }
            }
            .padding(.top, 12)
        }
    }

    func commentRow(for item: CommentsModel) -> some View {
        CommentsRow(
            imageName: item.imageName,
            personName: item.name,
            comment: item.comment,
            time: item.time
        )
    }
}
// MARK: - Preview
//
#Preview {
    CommentsView(
        viewModel: CommentsViewModel(dataProvider: MockCommentsDataProvider())
    )
}
