//
//  ProjectDetailsView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 06/11/2025.
//

import SwiftUI

struct ProjectDetailsView<ViewModel: ProjectDetailsViewModelType>: View {

    // MARK: - Properties
    @StateObject var viewModel: ViewModel

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                navigationBar()
                taskHeaderSection()
                taskImageSection()
                taskTimeSection()
                descriptionSection()
                assignedPersonsSection()
                commentSection()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

// MARK: - SubViews
extension ProjectDetailsView {
    func navigationBar() -> some View {
        CustomNavBar(
            showSearchIcon: false,
            onTappedBack: { viewModel.didTapBack() },
            onTappedNotification: { viewModel.didTapNotification() }
        )
    }

    func taskHeaderSection() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.taskCard.title)
                    .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))

                Text(viewModel.taskCard.subTitle)
                    .font(
                        .customfont(.regular, fontSize: 14 * .deviceFontScale)
                    )
                    .foregroundStyle(Color.LightGray)
            }
            Spacer()
        }
    }

    func taskImageSection() -> some View {
        Image(viewModel.taskCard.imageName)
            .resizable()
            .scaledToFit()
            .frame(
                width: .screenWidth / 1.5,
                height: .screenWidth / 1.5
            )
    }

    func taskTimeSection() -> some View {
        HStack {
            Text(viewModel.taskCard.day)
                .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                .foregroundStyle(Color.LightGray)

            Spacer()

            Text("\(viewModel.taskCard.start) to \(viewModel.taskCard.end)")
                .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                .foregroundStyle(Color.LightGray)
        }
    }

    func descriptionSection() -> some View {
        DescriptionRow()
    }

    func assignedPersonsSection() -> some View {
        AssignPersons(persons: viewModel.assignedPersons)
    }

    func commentSection() -> some View {
        VStack(spacing: 16) {
            CustomTextField(
                title: "Comment",
                placeholder: "Enter your comment",
                height: 100 * .deviceFontScale,
                text: Binding(
                    get: { viewModel.comment },
                    set: { viewModel.updateComment($0) }
                )
            )

            PrimaryButton(
                title: viewModel.isSubmittingComment
                    ? "Submitting..." : "Add Your Comment",
                action: { viewModel.submitComment() }
            )
            .disabled(
                viewModel.isSubmittingComment
                    || viewModel.comment.trimmingCharacters(
                        in: .whitespacesAndNewlines
                    ).isEmpty
            )
            .opacity(
                viewModel.isSubmittingComment
                    || viewModel.comment.trimmingCharacters(
                        in: .whitespacesAndNewlines
                    ).isEmpty ? 0.6 : 1.0
            )
        }
    }
}

// MARK: - Preview
#Preview {
    let taskCard = PlannedModel(
        title: "Client Review & Feedback",
        subTitle: "Redesign App",
        day: "Today",
        start: "10:00 am",
        end: "4:00 pm",
        imageName: "Mobile trading",
        colorSubTitle: Color.LightGray,
        colorCircle: Color.lightBeige,
        backgroundColor: Color.lightPink
    )

    let coordinator = AppCoordinator(taskStore: TaskStore())
    let viewModel = ProjectDetailsViewModel(
        taskCard: taskCard,
        sourceTab: .home,
        coordinator: coordinator,
        dataProvider: ProjectDetailsDataProvider.shared
    )
   
    ProjectDetailsView(
        viewModel: viewModel
    )
}
