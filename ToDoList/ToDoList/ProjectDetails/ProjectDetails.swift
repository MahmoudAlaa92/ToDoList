//
//  ProjectDetails.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 06/11/2025.
//

import SwiftUI

struct ProjectDetails: View {
    
    @State var changeComment: String = ""
    @State var taskCard: PlannedModel?
    weak var coordinator: AppCoordinator?
    var sourceTab: Tabs

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                CustomNavBar(showSearchIcon: false,
                             onTappedBack: { coordinator?.goBack(from: sourceTab)},
                             onTappedNotification: { coordinator?.pushNotification(for: sourceTab)})
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(taskCard?.title ?? "")
                            .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
                        
                        Text(taskCard?.subTitle ?? "")
                            .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                            .foregroundStyle(Color.LightGray)
                    }
                    Spacer()
                }
                
                Image(taskCard?.imageName ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth / 1.5,
                           height: .screenWidth / 1.5)
                
                HStack {
                    Text(taskCard?.day ?? "")
                        .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                    Spacer()
                    Text("\(taskCard?.start ?? "") to \(taskCard?.end ?? "")")
                        .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                }
                
                DescriptionRow()
                
                AssignPersons(persons: ["ProfilePicture", "ProfilePicture2"])
                CustomTextField(title: "Comment",
                                placeholder: "Enter your comment",
                                height: 100 * .deviceFontScale,
                                text: $changeComment)
                PrimaryButton(title: "Add Your Comment", action: {})
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProjectDetails(sourceTab: .home)
}
