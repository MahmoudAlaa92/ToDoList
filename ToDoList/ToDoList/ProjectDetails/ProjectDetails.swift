//
//  ProjectDetails.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 06/11/2025.
//

import SwiftUI

struct ProjectDetails: View {
    
    @State var changeComment: String = ""
    @State var title: String = "Client Review &Feedback"
    @State var subTitle: String = "Redesign app"
    @State var imageName: String = "cubes"
    @State var startDate: String = "11am"
    @State var endDate: String = "9pm"
    weak var coordinator: AppCoordinator?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                CustomNavBar(showSearchIcon: false)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
                        
                        Text(subTitle)
                            .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                            .foregroundStyle(Color.LightGray)
                    }
                    Spacer()
                }
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth / 1.5,
                           height: .screenWidth / 1.5)
                
                HStack {
                    Text("31August,2024")
                        .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                    Spacer()
                    Text("\(startDate) to \(endDate)")
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
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProjectDetails()
}
